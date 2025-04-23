import 'package:flutter/material.dart';
import 'package:food_app/core/utils/app_color.dart';
import 'package:food_app/core/utils/app_text_style.dart';

class CustomTextPrimaryColor extends StatelessWidget {
  const CustomTextPrimaryColor({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyle.textStyle14.copyWith(
        color: AppColor.kPrimaryColor,
        decoration: TextDecoration.underline,
        decorationColor: AppColor.kPrimaryColor, // لون الخط (اختياري)
      ),
    );
  }
}