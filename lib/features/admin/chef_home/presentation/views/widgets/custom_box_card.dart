import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/utils/app_color.dart';
import 'package:food_app/core/utils/app_text_style.dart';

class CustomBoxCard extends StatelessWidget {
  const CustomBoxCard({super.key, required this.number, required this.title});
  final String number;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 115.1.h,
      width: 157.96.w,
      decoration: BoxDecoration(
        color: AppColor.kGreyColor.withValues(alpha: 0.2),
        border: Border.all(
          width: 1.w,
          color: AppColor.kItemColor.withValues(alpha: 0.2),
        ),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        children: [
          Text(number, style: AppTextStyle.header.copyWith(fontSize: 40.sp)),
          Text(
            title,
            style: AppTextStyle.description.copyWith(
              color: AppColor.kItemColor,
            ),
          ),
        ],
      ),
    );
  }
}
