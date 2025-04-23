import 'package:flutter/material.dart';
import 'package:food_app/core/utils/app_color.dart';
import 'package:food_app/core/utils/app_text_style.dart';

class CustomTimeCharText extends StatelessWidget {
  const CustomTimeCharText({super.key, required this.time});

  final String time;
  @override
  Widget build(BuildContext context) {
    return Text(
      time,
      style: AppTextStyle.description.copyWith(color: AppColor.kItemColor),
    );
  }
}
