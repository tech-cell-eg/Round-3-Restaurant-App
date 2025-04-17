import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/utils/app_color.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:food_app/core/utils/app_text_style.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      width: 134.w,
      height: 60.h,
      decoration: BoxDecoration(
        border: Border.all(width: 0.4, color: AppColor.kItemColor),
        borderRadius: BorderRadius.circular(32.r),
      ),
    
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: Image.asset(
              AppImages.assetsImagesFoodHamburger,
              height: 44.h,
              width: 44.w,
            ),
          ),
    
          Text("Burger", style: AppTextStyle.textStyle12),
        ],
      ),
    );
  }
}
