import 'package:flutter/material.dart';
import 'package:food_app/core/ui/inputs.dart';
import 'package:food_app/core/ui/buttons.dart';
import 'package:food_app/core/constants/routes.dart';

class ForgetPasswordForm extends StatelessWidget {
  const ForgetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        TextInputField(
          label: "Email",
          hintText: "Enter your email",
          icon: Icons.person,
        ),
        const SizedBox(height: 20),
        Buttons.fill(onPressed: () { 
          Navigator.pushNamed(context, Routes.verifyEmail);
        }, label: "Send Code"),
      ],
    );
  }
}
