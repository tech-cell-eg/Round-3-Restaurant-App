import 'package:dio/dio.dart';

class AuthRepository {
  final Dio dio;

  AuthRepository(this.dio);

  Future<void> login(String email, String password) async {
    // final response = await dio.post(
    //   '/auth/login',
    //   data: {
    //     'email': email,
    //     'password': password,
    //   },
    // );
    // Handle response and save tokens if needed
  }

  Future<void> forgotPassword(String email) async {
    await dio.post(
      '/auth/forgot-password',
      data: {'email': email},
    );
  }
}