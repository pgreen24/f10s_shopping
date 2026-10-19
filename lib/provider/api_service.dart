import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class ApiService {
  final _dio = Dio();


  Future<String?> getUsernameByEmail(String email) async {
    try {
      final response = await _dio.get('https://dummyjson.com/users');
      if (response.statusCode == 200 && response.data != null) {
        List users = response.data['users'];


        final user = users.firstWhere(
              (u) => u['email'].toString().toLowerCase() == email.toLowerCase(),
          orElse: () => null,
        );

        if (user != null) {
          return user['username'];
        }
      }
      return null;
    } catch (e) {
      debugPrint("Email Search Error: $e");
      return null;
    }
  }


  Future<Response?> apiPostcall({required String username, required String password}) async {
    try {
      final response = await _dio.post(
        'https://dummyjson.com/auth/login',
        data: {
          'username': username,
          'password': password
        },
        options: Options(
            headers: {
              'Content-Type': 'application/x-www-form-urlencoded'
            }
        ),
      );
      return response;
    } catch (e) {
      debugPrint("Post Call Error: $e");
      return null;
    }
  }
  Future<Response> signupUser({
    required String firstName,
    required String lastName,
    required String maidenName,
    required String email,
    required String gender,
    required String password,
    required int age,

  }) async {
    return await _dio.post(
      'https://dummyjson.com/users/add',
      data: {
        'firstName': firstName,
        'lastName': lastName,
        'maidenName': maidenName,
        'email': email,
        'gender':gender,
        'password':password,
        'age': age,
      },
      options: Options(
        headers: { 'Content-Type': 'application/json' },
      ),
    );
  }
}
