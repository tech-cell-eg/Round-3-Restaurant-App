import 'package:flutter/material.dart';
import 'package:food_app/core/utils/app_text_style.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(title, style: AppTextStyle.textStyle20);
  }
}
