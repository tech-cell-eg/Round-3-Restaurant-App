import 'package:flutter/material.dart';
import 'package:food_app/features/auth/presentation/widgets/auth_widget.dart';
import 'package:food_app/features/auth/presentation/widgets/forget_password_form.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthScreen(
        showBackArrow: true,
        title: "Forget Password ",
        subtitle: "Please sign in to your existing account",
        form: const ForgetPasswordForm(),
      ),
    );
  }
}
