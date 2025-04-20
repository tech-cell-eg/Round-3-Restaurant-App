import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/ui/custom_icon_image_avatar.dart';
import 'package:food_app/core/utils/app_color.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:food_app/core/utils/app_text_style.dart';

class CustomAppBarMenu extends StatelessWidget {
  const CustomAppBarMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10.w,
      children: [
        CustomIconImageAvatar(
          image: AppImages.assetsIconsBack,
          backColor: AppColor.kGreyColor,
        ),
        Text(
          "Profile",
          style: AppTextStyle.textStyle16.copyWith(fontSize: 17.sp),
        ),
        Spacer(),
        CustomIconImageAvatar(
          image: AppImages.assetsIconsMore,
          backColor: AppColor.kGreyColor,
        ),
      ],
    );
  }
}
