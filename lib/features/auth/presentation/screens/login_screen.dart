import 'package:flutter/material.dart';
import 'package:food_app/features/auth/presentation/widgets/auth_widget.dart';
import 'package:food_app/features/auth/presentation/widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthScreen(
        title: "Login",
        subtitle: "Welcome back! Please login to your account.",
        form: SingleChildScrollView(child: LoginForm()),
        formHeightRatio: 0.66,
      ),
    );
  }
}
