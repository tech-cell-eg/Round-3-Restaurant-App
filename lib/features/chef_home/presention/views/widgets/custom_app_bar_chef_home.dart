import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/core/ui/custom_icon_image_avatar.dart';
import 'package:food_app/core/utils/app_color.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:food_app/core/utils/app_text_style.dart';

class CustomAppBarChefHome extends StatelessWidget {
  const CustomAppBarChefHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 18.w,
      children: [
        CustomIconImageAvatar(
          image: AppImages.assetsIconsMenu,
          backColor: AppColor.kItemColor.withValues(alpha: 0.2),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
    
          children: [
            Text(
              "Deliver to",
              style: AppTextStyle.textStyle12.copyWith(
                color: AppColor.kPrimaryColor,
              ),
            ),
            Row(
              children: [
                Text("Halal Lab office", style: AppTextStyle.textStyle14),
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
        ClipRRect(
          borderRadius: BorderRadius.circular(32.r),
          child: Image.asset(
            AppImages.assetsIconsProfileImage,
            height: 45.h,
            width: 45.w,
          ),
        ),
      ],
    );
  }
}
