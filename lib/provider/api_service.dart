import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class ApiService {
  final _dio = Dio();

  Future<dynamic> apiGetcall({required String email, required String password}) async {
    try {
      final response = await _dio.get('https://dummyjson.com/users',
        data: {
          'email': email,
          'password': password
        },);
      return response;
    } catch (e) {
      debugPrint("Get Call Error: $e");
      return null;
    }
  }

  Future<dynamic> apiPostcall({required String email, required String password}) async {
    try {

      final response = await _dio.post('https://dummyjson.com/auth/login',
        data: {
          'email': email,
          'password': password
        },
        options: Options(
            headers: {
              'Content-Type': 'application/json'
            }
        ),
      );
      return response;
    } catch (e) {
      debugPrint("Post Call Error: $e");
      return null;
    }
  }
}
