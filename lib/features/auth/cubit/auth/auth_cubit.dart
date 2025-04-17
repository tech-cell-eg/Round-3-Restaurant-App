import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import '../repo/repo.dart';
part 'auth_state.dart';




class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;

  AuthCubit(this.authRepository) : super(AuthInitial());

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      await authRepository.login(email, password);
      emit(AuthSuccess());
    } on DioException catch (e) {
      emit(AuthError(e.response?.data['message'] ?? 'Login failed'));
    } catch (e) {
      emit(AuthError('An unexpected error occurred'));
    }
  }

  Future<void> forgotPassword(String email) async {
    emit(AuthLoading());
    try {
      await authRepository.forgotPassword(email);
      emit(AuthSuccess());
    } on DioException catch (e) {
      emit(AuthError(e.response?.data['message'] ?? 'Password reset failed'));
    } catch (e) {
      emit(AuthError('An unexpected error occurred'));
    }
  }
}



