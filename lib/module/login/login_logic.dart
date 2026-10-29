import 'package:f10s_shopping/provider/api_service.dart';
import 'package:f10s_shopping/module/home/home_view.dart';
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
      Map<String, String>? userDetails = await ApiService().getUsernameByEmail(
          emailInput);

      if (userDetails == null) {
        Get.snackbar("Login Failed", "No user found with this email address",
            snackPosition: SnackPosition.TOP);
        return;
      }

      String actualUsername = userDetails['username'] ?? '';
      String fetchedMaidenName = userDetails['maidenName'] ?? '';
      String fetchedAddress = userDetails['address'] ?? '';
      String bankCardNumber = userDetails['bankCardNumber'] ?? '';
      String bankCardExpire = userDetails['bankCardExpire'] ?? '';
      String bankCardType = userDetails['bankCardType'] ?? 'VISA';

      final dio.Response? response = await ApiService().apiPostcall(
        username: actualUsername,
        password: passwords,
      );

      if (response?.statusCode == 200) {
        String accessToken = response?.data['accessToken'] ?? '';
        String firstName = response?.data['firstName'] ?? '';
        String lastName = response?.data['lastName'] ?? '';
        String email = response?.data['email'] ?? emailInput;
        String userImageUrl = response?.data['image'] ?? '';

        String fullName = "$firstName $lastName $fetchedMaidenName";
        if (fullName.isEmpty) fullName = actualUsername;


        await Future.wait([
          storage.write('isLoggedIn', true),
          secureStorage.write(key: 'token', value: accessToken),
          secureStorage.write(key: 'saved_email', value: emailInput),
          secureStorage.write(key: 'saved_password', value: passwords),
          storage.write('userName', fullName),
          storage.write('userEmail', email),
          storage.write('userProfileImage', userImageUrl),
          storage.write('userAddress', fetchedAddress),
          storage.write('userCardNumber', bankCardNumber),
          storage.write('userCardExpire', bankCardExpire),
          storage.write('userCardType', bankCardType),
        ]);

        final homeLogic = Get.put(HomeLogic(), permanent: true);
        homeLogic.setUserData(
          name: fullName,
          email: email,
          imageUrl: userImageUrl,
          address: fetchedAddress,
          bankCardNumber: bankCardNumber,
          bankCardExpire: bankCardExpire,
          bankCardType: bankCardType,
        );

        Get.snackbar("Success", "Login Successful", snackPosition: SnackPosition.TOP);
        Get.offAll(() => const HomePage());
      }
      else {
        Get.snackbar("Login Failed", "Invalid password. Please try again.",
            snackPosition: SnackPosition.TOP);
      }
    } catch (e) {
      Get.snackbar("Error", "Something went wrong: $e",
          snackPosition: SnackPosition.TOP);
    }
  }
}
