import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/utils/app_color.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:food_app/core/ui/custom_section_menu.dart';

class FirstCardOfMenu extends StatelessWidget {
  const FirstCardOfMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,vertical: 8.h,
      
      ),
      height: 136.h,
      width: 327.w,
      decoration: BoxDecoration(
        color: AppColor.kGreyColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        children: [
          CustomSectionMenu(
            title: 'Personal Info',
            image: AppImages.assetsIconsUser,
            colorImage: AppColor.kPrimaryColor,
          ),
          SizedBox(height: 16.h),
          CustomSectionMenu(
            title: 'Addresses',
            image: AppImages.assetsIconsMap,
            colorImage: Color(0xff413DFB),
          ),
        ],
      ),
    );
  }
}


