import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/ui/custom_icon_image_avatar.dart';
import 'package:food_app/core/utils/app_color.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:food_app/core/utils/app_text_style.dart';

class CustomHeaderPage extends StatelessWidget {
  const CustomHeaderPage({
    super.key,
  });

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
            Row(
              spacing: 10.w,
              children: [
                CustomIconImageAvatar(
                  image: AppImages.assetsIconsBack,
                  backColor: AppColor.kGreyColor,
                ),
                Text(
                  "My Profile",
                  style: AppTextStyle.textStyle16.copyWith(
                    fontSize: 17,
                    color: AppColor.kWhiteColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 35.h),
            Text(
              "Available Balance",
              style: AppTextStyle.textStyle16.copyWith(
                color: AppColor.kWhiteColor,
              ),
            ),
            Text(
              "\$500.00",
              style: AppTextStyle.textStyle24.copyWith(
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
                style: AppTextStyle.textStyle14.copyWith(
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
