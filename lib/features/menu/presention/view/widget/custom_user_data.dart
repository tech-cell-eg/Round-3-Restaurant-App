import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/utils/app_color.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:food_app/core/utils/app_text_style.dart';

class CustomUserData extends StatelessWidget {
  const CustomUserData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10.w,
      children: [
        Image.asset(
          AppImages.assetsIconsProfileImage,
          height: 100.h,
          width: 100.w,
        ),
        Column(
          children: [
            Text("Vishal Khadok", style: AppTextStyle.textStyle20),
            Text(
              "I love fast food",
              style: AppTextStyle.textStyle20.copyWith(
                color: AppColor.kItemColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
