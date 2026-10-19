import 'package:f10s_shopping/provider/api_service.dart';
import 'package:f10s_shopping/module/home/home_view.dart'; // আপনার হোম পেজটি ইমপোর্ট করুন
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:dio/dio.dart' as dio;

import '../home/home_logic.dart';

class LoginLogic extends GetxController {
  final RxBool isObscureText = true.obs;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GetStorage storage = GetStorage();
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  Future<void> logInApiCall() async {
    final String emailInput = emailController.text.trim();
    final String passwords = passwordController.text.trim();

    if (emailInput.isEmpty || passwords.isEmpty) {
      Get.snackbar("Error", "Email and Password cannot be empty",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    try {

      String? actualUsername = await ApiService().getUsernameByEmail(emailInput);

      if (actualUsername == null) {
        Get.snackbar("Login Failed", "No user found with this email address",
            snackPosition: SnackPosition.TOP);
        return;
      }


      final dio.Response? response = await ApiService().apiPostcall(
        username: actualUsername,
        password: passwords,
      );



      if (response?.statusCode == 200) {
        String accessToken = response?.data['accessToken'] ?? '';
        String firstName = response?.data['firstName'] ?? '';
        String lastName = response?.data['lastName'] ?? '';
        String maidenName = response?.data['maidenName'] ?? '';
        String email = response?.data['email'] ?? emailInput;
        String fullName = "$firstName $maidenName $lastName".trim();
        if(fullName.isEmpty) fullName = actualUsername ?? "User";

        await storage.write('isLoggedIn', true);
        await secureStorage.write(key: 'token', value: accessToken);
        await secureStorage.write(key: 'saved_email', value: emailInput);
        await secureStorage.write(key: 'saved_password', value: passwords);
        await storage.write('userName', fullName);
        await storage.write('userEmail', email);

        final homeLogic = Get.put(HomeLogic());
        homeLogic.setUserData(name: fullName, email: email);

        Get.snackbar("Success", "Login Successful", snackPosition: SnackPosition.TOP);
        Get.offAll(() => const HomePage());
      }

      else {
        Get.snackbar("Login Failed", "Invalid password. Please try again.", snackPosition: SnackPosition.TOP);
      }
    } catch (e) {
      Get.snackbar("Error", "Something went wrong: $e", snackPosition: SnackPosition.TOP);
    }
  }
}
