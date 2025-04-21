import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/ui/custom_icon_image_avatar.dart';
import 'package:food_app/core/utils/app_color.dart';
import 'package:food_app/core/utils/app_text_style.dart';

class CustomSectionMenu extends StatelessWidget {
  const CustomSectionMenu({
    super.key,
    required this.title,
    required this.image, required this.colorImage,
  });
  final String title;
  final String image;
  final Color colorImage;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 11.w,
      children: [
        CustomIconImageAvatar(
          image: image,
          backColor: AppColor.kWhiteColor,
          colorImage: colorImage,
        ),
        Text(title, style: AppTextStyle.textStyle16),
        Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_forward_ios, size: 10.sp),
        ),
      ],
    );
  }
}
