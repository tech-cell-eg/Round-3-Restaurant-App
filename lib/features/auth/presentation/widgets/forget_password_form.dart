import 'package:flutter/material.dart';
import 'package:food_app/core/constants/routes.dart';
import 'package:food_app/core/ui/buttons.dart';
import 'package:food_app/features/auth/presentation/widgets/text_form_field.dart';

class ForgetPasswordForm extends StatelessWidget {
  const ForgetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        AppTextFormField(
          label: "Email",
          hintText: "Enter your email",
          prefixIcon: Icons.person,
        ),
        const SizedBox(height: 20),
        Buttons.fill(onPressed: () { 
          Navigator.pushNamed(context, Routes.verifyEmail);
        }, label: "Send Code"),
      ],
    );
  }
}
