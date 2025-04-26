import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/utils/app_color.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:food_app/core/utils/app_text_style.dart';

class RunningOrderCard extends StatelessWidget {
  const RunningOrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 8.0, right: 8.0),
      child: Row(
        spacing: 8.w,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Image.asset(
              AppImages.assetsImagesFoodVegetables,
              height: 102.h,
              width: 102.w,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "#Breakfast",
                style: AppTextStyle.description.copyWith(
                  color: AppColor.kPrimaryColor,
                ),
              ),
              Text("Chicken Thai Biriyani", style: AppTextStyle.description),
              Text(
                "ID: 32053",
                style: AppTextStyle.description.copyWith(
                  color: AppColor.kItemColor,
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                spacing: 8.w,
                children: [
                  Text("\$60", style: AppTextStyle.description),
                  SizedBox(width: 10.w),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.kPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Done",
                      style: AppTextStyle.description.copyWith(
                        color: AppColor.kWhiteColor,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          width: 1,
                          color: AppColor.kPrimaryColor,
                        ),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Cancel",
                      style: AppTextStyle.description.copyWith(
                        color: AppColor.kPrimaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
