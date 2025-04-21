import 'package:flutter/material.dart';
import 'package:food_app/core/ui/inputs.dart';
import 'package:food_app/core/ui/buttons.dart';
import 'package:food_app/core/constants/routes.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          TextInputField(
            label: "Full Name",
            hintText: "Enter your full name",
            icon: Icons.person,
          ),
          const SizedBox(height: 15),
          TextInputField(
            label: "Email",
            hintText: "Enter your email",
            icon: Icons.person,
          ),
          const SizedBox(height: 15),
          PasswordInputField(
            label: "Password",
            hintText: "Enter your password",
          ),
          const SizedBox(height: 15),
          PasswordInputField(
            label: "Confirm Password",
            hintText: "Re-enter your password",
          ),
          const SizedBox(height: 30),
          Buttons.fill(
            onPressed: () {
              Navigator.pushNamed(context, Routes.login);
            },
            label: "Sign Up",
          ),
        ],
      ),
    );
  }
}
