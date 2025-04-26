import 'package:flutter/material.dart';
import 'package:food_app/core/utils/app_color.dart';
import 'package:food_app/core/utils/app_text_style.dart';

class TitleSectionWithSeeAll extends StatelessWidget {
  const TitleSectionWithSeeAll({super.key, required this.titleSection});
  final String titleSection;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(titleSection, style: AppTextStyle.header),
        Spacer(),
        Text("See All ", style: AppTextStyle.subTitle),
        Icon(Icons.arrow_forward_ios, size: 15, color: AppColor.kItemColor),
      ],
    );
  }
}
