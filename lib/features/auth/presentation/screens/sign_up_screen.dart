import 'package:flutter/material.dart';
import 'package:food_app/features/auth/presentation/widgets/auth_widget.dart';
import 'package:food_app/features/auth/presentation/widgets/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthScreen(
        showBackArrow: true,
        title: "Sign Up",
        subtitle: "Please sign up to get started",
        form: const SignUpForm(),
      ),
    );
  }
}
