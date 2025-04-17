import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/core/utils/app_color.dart';
import 'package:food_app/core/utils/app_text_style.dart';

class IconImageAndTitle extends StatelessWidget {
  const IconImageAndTitle({
    super.key,
    required this.image,
    required this.title,
  });
  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5,
      children: [
        SvgPicture.asset(image, color: AppColor.kSecondaryColor),
        Text(title, style: AppTextStyle.textStyle16),
      ],
    );
  }
}
