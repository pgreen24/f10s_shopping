import 'package:f10s_shopping/provider/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:dio/dio.dart' as dio;

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
    final String emails = emailController.text.trim();
    final String passwords = passwordController.text.trim();

    if (emails.isEmpty || passwords.isEmpty) {
      Get.snackbar("Error", "Email and Password cannot be empty",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    try {

      final dio.Response? data = await ApiService().apiGetcall(email: emails, password: passwords,);

      if ( data?.statusCode == 200) {

        await storage.write('isLoggedIn', true);
        await secureStorage.write(key: 'saved_email', value: emails);
        await secureStorage.write(key: 'saved_password', value: passwords);

        Get.snackbar("Success", "Login Successful", snackPosition: SnackPosition.TOP);

      } else {
        Get.snackbar("Login Failed", "Invalid email or password", snackPosition: SnackPosition.TOP);
      }
    } catch (e) {
      Get.snackbar("Error", "Something went wrong: $e", snackPosition: SnackPosition.TOP);
    }
  }
}
