import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/utils/app_color.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:food_app/features/menu/presention/view/widget/custom_section_menu.dart';

class ThirdCardOfMenu extends StatelessWidget {
  const ThirdCardOfMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      height: 192.h,
      width: 327.w,
      decoration: BoxDecoration(
        color: AppColor.kGreyColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        spacing: 8.h,
        children: [
          CustomSectionMenu(
            title: 'FAQs',
            image: AppImages.assetsIconsQuestion,
            colorImage: AppColor.kPrimaryColor,
          ),
          CustomSectionMenu(
            title: 'User Reviews',
            image: AppImages.assetsIconsReview,
            colorImage: Color(0xFF2AE1E1),
          ),
          CustomSectionMenu(
            title: 'Settings',
            image: AppImages.assetsIconsSettings,
            colorImage: Color(0xFF413DFB),
          ),
        ],
      ),
    );
  }
}
