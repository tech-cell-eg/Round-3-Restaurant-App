import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/constants/routes.dart';
import 'package:food_app/core/ui/custom_section_menu.dart';
import 'package:food_app/core/utils/app_color.dart';
import 'package:food_app/core/utils/app_images.dart';

class UserReviews extends StatelessWidget {
  const UserReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, Routes.review),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
        height: 80.h,
        width: 327.w,
        decoration: BoxDecoration(
          color: AppColor.kGreyColor,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: CustomSectionMenu(
          title: 'User Reviews',
          image: AppImages.assetsIconsReview,
          colorImage: AppColor.kPrimaryColor,
        ),
      ),
    );
  }
}
