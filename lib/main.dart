import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/auth/cubit/auth/auth_cubit.dart';
import 'features/auth/cubit/repo/repo.dart';
import 'features/auth/presentation/screens/forget_password.dart';
import 'features/auth/presentation/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Delivery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      routes: {
        '/':
            (context) => BlocProvider(
              create: (context) => AuthCubit(AuthRepository(Dio())),
              child: const LoginScreen(),
            ),
        '/forgot-password':
            (context) => BlocProvider(
              create: (context) => AuthCubit(AuthRepository(Dio())),
              child: const ForgotPasswordScreen(),
            ),
      },
    );
  }
}
