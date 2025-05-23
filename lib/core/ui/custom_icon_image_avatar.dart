import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/core/utils/app_color.dart';

class CustomIconImageAvatar extends StatelessWidget {
  const CustomIconImageAvatar({
    super.key,
    required this.image,
    required this.backColor,
    this.colorImage,
  });
  final String image;
  final Color backColor;
  final Color? colorImage;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: backColor,
      child: SvgPicture.asset(
        image,
        colorFilter: ColorFilter.mode(
          colorImage ?? AppColor.kWhiteColor,
          BlendMode.srcIn,
        ),
        width: 20,
        height: 20,
        fit: BoxFit.cover,
      ),
    );
  }
}
