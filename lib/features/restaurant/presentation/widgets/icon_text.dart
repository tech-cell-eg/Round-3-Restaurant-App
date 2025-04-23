import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/core/utils/app_color.dart';

class IconText extends StatelessWidget {
  final bool bold;
  final String icon, text;
  const IconText({
    super.key,
    required this.icon,
    required this.text,
    this.bold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5.w,
      children: [
        SvgPicture.asset(
          icon,
          colorFilter: const ColorFilter.mode(
            AppColor.kSecondaryColor,
            BlendMode.srcIn,
          ),
          width: 25.w,
          height: 25.h,
          fit: BoxFit.fill,
        ),
        Text(text, style: bold ? TextStyle(fontWeight: FontWeight.bold) : null),
      ],
    );
  }
}
