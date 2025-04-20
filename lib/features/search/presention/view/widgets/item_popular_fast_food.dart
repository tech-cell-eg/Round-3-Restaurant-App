import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/utils/app_color.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:food_app/core/utils/app_text_style.dart';

class ItemPopularFastFood extends StatelessWidget {
  const ItemPopularFastFood({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 144.h,
      width: 153.w,
      child: Stack(
        children: [
          Positioned(
            right: 25.w,
            top: 40.h,
            child: Container(
              padding: EdgeInsets.only(bottom: 5.h),
              height: 102.5.h,
              width: 153.w,
              decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: AppColor.kGreyColor),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                spacing: 5.h,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "European Pizza",
                    style: AppTextStyle.textStyle14.copyWith(fontSize: 15.sp),
                  ),
                  Text(
                    "Uttora Coffe House",
                    style: AppTextStyle.textStyle13.copyWith(
                      color: AppColor.kItemColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.asset(
              AppImages.assetsImagesPizza,
              height: 84.h,
              width: 122.w,
            ),
          ),
        ],
      ),
    );
  }
}
