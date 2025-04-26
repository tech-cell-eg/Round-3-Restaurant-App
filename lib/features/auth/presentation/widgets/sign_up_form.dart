import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/constants/routes.dart';
import 'package:food_app/core/ui/buttons.dart';
import 'package:food_app/core/ui/inputs.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        spacing: 20.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            spacing: 10.h,
            children: [
              TextInputField(
                label: "Full Name",
                hint: "Enter your full name",
                icon: Icons.person,
              ),
              TextInputField(
                label: "Email",
                hint: "Enter your email",
                icon: Icons.person,
              ),
              PasswordInputField(
                label: "Password",
                hint: "Enter your password",
              ),
              PasswordInputField(
                label: "Confirm Password",
                hint: "Confirm password",
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Buttons.fill(
              onPressed: () {
                Navigator.pushNamed(context, Routes.login);
              },
              label: "Sign Up",
            ),
          ),
        ],
      ),
    );
  }
}
