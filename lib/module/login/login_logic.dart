import 'package:f10s_shopping/provider/api_service.dart';
import 'package:f10s_shopping/module/home/home_view.dart';
import 'package:f10s_shopping/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:dio/dio.dart' as dio;

import '../home/home_logic.dart';

class LoginLogic extends GetxController {
  final RxBool isObscureText = true.obs;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GetStorage storage = GetStorage();
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  @override
  void onInit() {
    super.onInit();
    _loadSavedCredentials();
  }

  Future<void> _loadSavedCredentials() async {
    try {

      String? lastUser = await secureStorage.read(key: 'last_logged_in_user');

      if (lastUser != null) {
        usernameController.text = lastUser;

        String? savedPassword = await secureStorage.read(key: 'saved_password_$lastUser');
        if (savedPassword != null) {
          passwordController.text = savedPassword;
        }
      }
    } catch (e) {
      debugPrint("Error loading saved credentials: $e");
    }
  }

  Future<void> logInApiCall() async {
    final String usernameInput = usernameController.text.trim();
    final String passwords = passwordController.text.trim();

    if (usernameInput.isEmpty || passwords.isEmpty) {
      Get.snackbar("Error", "Username and Password cannot be empty",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    try {
      final dio.Response? response = await ApiService().apiPostcall(
        username: usernameInput,
        password: passwords,
      );


      if (response?.statusCode == 200 && response?.data != null) {
        String userId = (response?.data['id'] ?? '').toString();
        String accessToken = response?.data['accessToken'] ?? '';
        String firstName = (response?.data['firstName'] ?? '').toString();
        String lastName = (response?.data['lastName'] ?? '').toString();
        String userImageUrl = (response?.data['image'] ?? '').toString();
        String fetchedEmail = (response?.data['email'] ?? '').toString();

        String fetchedMaidenName = '';
        String fetchedAddress = '';
        String bankCardNumber = '';
        String bankCardExpire = '';
        String bankCardType = 'VISA';


        if (fetchedEmail.isNotEmpty) {
          Map<String, String>? userDetails = await ApiService().getUsernameByEmail(fetchedEmail);
          if (userDetails != null) {
            fetchedMaidenName = userDetails['maidenName'] ?? '';
            fetchedAddress = userDetails['address'] ?? '';
            bankCardNumber = userDetails['bankCardNumber'] ?? '';
            bankCardExpire = userDetails['bankCardExpire'] ?? '';
            bankCardType = userDetails['bankCardType'] ?? 'VISA';
          }
        }

        String fullName = "$firstName $lastName $fetchedMaidenName".trim();
        if (fullName.isEmpty) fullName = usernameInput;

        String userKey = userId;

        await storage.write('isLoggedIn', true);
        await storage.write('currentUserKey', userKey);
        await storage.write('last_logged_in_user', userKey);

        await secureStorage.write(key: 'token_$userKey', value: accessToken);
        await secureStorage.write(key: 'last_logged_in_user', value: usernameInput);
        await secureStorage.write(key: 'saved_password_$userKey', value: passwords);

        await storage.write('userName_$userKey', fullName);
        await storage.write('userEmail_$userKey', fetchedEmail);
        await storage.write('userProfileImage_$userKey', userImageUrl);
        await storage.write('userAddress_$userKey', fetchedAddress);
        await storage.write('userCardNumber_$userKey', bankCardNumber);
        await storage.write('userCardExpire_$userKey', bankCardExpire);
        await storage.write('userCardType_$userKey', bankCardType);
        await storage.save();

        Get.snackbar("Success", "Login Successful", snackPosition: SnackPosition.TOP);
        Get.offAllNamed(AppRoutes.home);


    } else {
        Get.snackbar("Login Failed", "Invalid username or password. Please try again.",
            snackPosition: SnackPosition.TOP);
      }
    } catch (e) {
      Get.snackbar("Error", "Something went wrong: $e",
          snackPosition: SnackPosition.TOP);
    }
  }


  @override
  void onClose() {
    usernameController.clear();
    passwordController.clear();
    super.onClose();
  }
}




