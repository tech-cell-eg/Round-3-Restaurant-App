
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/utils/app_color.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:food_app/features/menu/presention/view/widget/custom_section_menu.dart';

class SecondCardOfMenu extends StatelessWidget {
  const SecondCardOfMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      height: 248.h,
      width: 327.w,
      decoration: BoxDecoration(
        color: AppColor.kGreyColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        spacing: 8.h,
        children: [
          CustomSectionMenu(
            title: 'Cart',
            image: AppImages.assetsIconsCart,
            colorImage: Color(0xFF369BFF),
          ),
          CustomSectionMenu(
            title: 'Favorites',
            image: AppImages.assetsIconsFavorite,
            colorImage: Color(0xFFB33DFB),
          ),
          CustomSectionMenu(
            title: 'Notifications',
            image: AppImages.assetsIconsNotification,
            colorImage: AppColor.kSecondaryColor,
          ),
          CustomSectionMenu(
            title: 'Payment Method',
            image: AppImages.assetsIconsCredit,
            colorImage: Color(0xFF369BFF),
          ),
        ],
      ),
    );
  }
}
