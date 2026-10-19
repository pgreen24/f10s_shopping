import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../provider/api_service.dart';
import '../login/data_model/user_data_model.dart';

class SignInLogic extends GetxController {

  final RxBool isLoading = false.obs;

  Future<bool> registerUser({
    required UserDataModel userModel,
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
        age: userModel.age,
      );


      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar(
          "Success",
          "Account created successfully!",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        return true;
      } else {
        Get.snackbar("Error", "Signup failed. Please try again.");
        return false;
      }
    } catch (e) {
      Get.snackbar("Error", "Something went wrong: $e");
      return false;
    } finally {
      isLoading.value = false;
    }
  }
}

