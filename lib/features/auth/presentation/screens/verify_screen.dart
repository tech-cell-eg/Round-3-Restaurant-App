import 'package:flutter/material.dart';
import 'package:food_app/features/auth/presentation/widgets/auth_widget.dart';
import 'package:food_app/features/auth/presentation/widgets/verify_form.dart';

class VerifyScreen extends StatelessWidget {
  const VerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthScreen(
        showBackArrow: true,
        title: "Verification",
        subtitle: "We have sent a code to your email \nexample@gmail.com",
        form: const VerifyForm(),
      ),
    );
  }
}
