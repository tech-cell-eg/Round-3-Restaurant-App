import 'package:flutter/material.dart';
import 'package:food_app/core/constants/routes.dart';
import 'package:food_app/core/ui/buttons.dart';
import 'package:food_app/features/auth/presentation/widgets/text_form_field.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          AppTextFormField(
            label: "Full Name",
            hintText: "Enter your full name",
            prefixIcon: Icons.person,
          ),
          const SizedBox(height: 15),
          AppTextFormField(
            label: "Email",
            hintText: "Enter your email",
            prefixIcon: Icons.person,
          ),
          const SizedBox(height: 15),
          AppTextFormField(
            label: "Password",
            hintText: "Enter your password",
            obscureText: true,
            prefixIcon: Icons.lock,
          ),
          const SizedBox(height: 15),
          AppTextFormField(
            label: "Confirm Password",
            hintText: "Re-enter your password",
            obscureText: true,
            prefixIcon: Icons.lock,
          ),
          const SizedBox(height: 30),
          Buttons.fill(onPressed: () {
            Navigator.pushNamed(context, Routes.login);
          }, label: "Sign Up"),
        ],
      ),
    );
  }
}
