import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/core/constants/routes.dart';
import 'package:food_app/core/ui/badge_count.dart';
import 'package:food_app/core/ui/custom_icon_image_avatar.dart';
import 'package:food_app/core/utils/app_color.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:food_app/core/utils/app_text_style.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 18.w,
      children: [
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, Routes.profile),
          child: CustomIconImageAvatar(
            image: AppImages.assetsIconsMenu,
            colorImage: AppColor.kBlackColor,
            backColor: AppColor.kItemColor.withValues(alpha: 0.2),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              "Deliver to",
              style: AppTextStyle.label.copyWith(color: AppColor.kPrimaryColor),
            ),
            Row(
              children: [
                Text("Halal Lab office", style: AppTextStyle.description),
                SvgPicture.asset(
                  AppImages.assetsIconsPolygon,
                  width: 11.w,
                  height: 10.h,
                ),
              ],
            ),
          ],
        ),
        Spacer(),
        BadgeCount(),
      ],
    );
  }
}
