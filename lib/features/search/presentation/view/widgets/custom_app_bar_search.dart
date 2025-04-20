import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/ui/badge_count.dart';
import 'package:food_app/core/ui/custom_icon_image_avatar.dart';
import 'package:food_app/core/utils/app_color.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:food_app/core/utils/app_text_style.dart';

class CustomAppBarSearch extends StatelessWidget {
  const CustomAppBarSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10.w,
      children: [
        CustomIconImageAvatar(
          image: AppImages.assetsIconsBack,
          backColor: AppColor.kItemColor.withValues(alpha: 0.2),
        ),
        Text("Search", style: AppTextStyle.title),
        Spacer(),
        BadgeCount(),
      ],
    );
  }
}
