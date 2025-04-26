import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/utils/app_color.dart';
import 'package:food_app/core/utils/app_text_style.dart';

class CustomHeaderPage extends StatelessWidget {
  const CustomHeaderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 271.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.kPrimaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Available Balance",
              style: AppTextStyle.subTitle.copyWith(
                color: AppColor.kWhiteColor,
              ),
            ),
            Text(
              "\$500.00",
              style: AppTextStyle.header.copyWith(
                fontSize: 40.sp,

                color: AppColor.kWhiteColor,
              ),
            ),
            SizedBox(height: 17.h),
            Container(
              width: 100.w,
              height: 37.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.kWhiteColor, width: 1.w),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Text(
                "Withdraw",
                style: AppTextStyle.description.copyWith(
                  color: AppColor.kWhiteColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
