import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../provider/api_service.dart';
import 'data_model/signup_data_model.dart';

class SignInLogic extends GetxController {
  final RxBool isLoading = false.obs;

  Future<SignupDataModel?> registerUser({
    required SignupDataModel userModel,
    required String password,
  }) async {
    try {
      isLoading.value = true;

      final response = await ApiService().signupUser(
        firstName: userModel.firstName,
        lastName: userModel.lastName,
        maidenName: userModel.maidenName,
        email: userModel.email,
        gender: userModel.gender.toLowerCase(),
        password: password,
        age: userModel.age is int ? userModel.age : (int.tryParse(userModel.age.toString()) ?? 0),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar(
          "Success",
          "Account created successfully!",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

        return SignupDataModel.fromJson(response.data);
      } else {
        Get.snackbar("Error", "Signup failed. Please try again.",
            backgroundColor: Colors.red, colorText: Colors.white);
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", "Something went wrong: $e",
          backgroundColor: Colors.red, colorText: Colors.white);
      return null;
    } finally {
      isLoading.value = false;
    }
  }
}




