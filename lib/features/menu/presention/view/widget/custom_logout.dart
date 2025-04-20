import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/utils/app_color.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:food_app/features/menu/presention/view/widget/custom_section_menu.dart';

class CustomLogout extends StatelessWidget {
  const CustomLogout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      height: 80.h,
      width: 327.w,
      decoration: BoxDecoration(
        color: AppColor.kGreyColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: CustomSectionMenu(
        title: 'Logout',
        image: AppImages.assetsIconsLogout,
        colorImage: AppColor.kPrimaryColor,
      ),
    );
  }
}
