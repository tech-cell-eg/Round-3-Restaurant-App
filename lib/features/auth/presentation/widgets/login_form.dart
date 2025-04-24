import 'package:flutter/material.dart';
import 'package:food_app/core/constants/routes.dart';
import 'package:food_app/core/ui/buttons.dart';
import 'package:food_app/core/ui/inputs.dart';
import 'package:food_app/core/utils/app_color.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:food_app/core/utils/app_text_style.dart';
import 'package:food_app/features/auth/presentation/widgets/custom_row.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 5),
          TextInputField(
            label: "Email",
            icon: Icons.person,
            hint: "Enter your email",
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 5),
          PasswordInputField(label: "Password", hint: "Enter your password"),
          const SizedBox(height: 5),
          CustomRow(
            onPressed: () {
              Navigator.pushNamed(context, Routes.forgotPassword);
            },
            textButtonText: "Forgot Password?",
            checkboxText: "Remember me",
          ),
          const SizedBox(height: 5),
          Buttons.fill(
            onPressed: () {
              Navigator.pushReplacementNamed(context, Routes.home);
            },
            label: "Login",
          ),
          const SizedBox(height: 5),
          CustomRow2(
            onPressed: () {
              Navigator.pushNamed(context, Routes.signup);
            },
            textButtonText: "Sign Up",
            text: "Don't have an account?",
          ),
          const SizedBox(height: 5),
          Center(
            child: Text(
              "Or",
              style: AppTextStyle.subTitle.copyWith(
                color: AppColor.kPrimaryDark,
              ),
            ),
          ),

          const SizedBox(height: 5),
          const CustomRow3(
            image1: AppImages.assetsIconsFacebook,
            image2: AppImages.assetsIconsTwitter,
            image3: AppImages.assetsIconsAppleIcon,
          ),
          const SizedBox(height: 5),
          CustomRow2(
            onPressed: () {
              Navigator.pushReplacementNamed(context, Routes.chefHome);
            },
            textButtonText: "Login as Chef",
            text: "Are you a chef ?",
          ),
        ],
      ),
    );
  }
}
