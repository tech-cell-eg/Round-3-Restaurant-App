import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/core/utils/app_color.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:food_app/core/utils/app_text_style.dart';
import 'package:food_app/features/review/presention/views/widget/rating.dart';

class CustomCardReview extends StatelessWidget {
  const CustomCardReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(32),
          child: Image.asset(
            AppImages.assetsIconsProfileImage,
            height: 43.h,
            width: 43.w,
            fit: BoxFit.fill,
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(
              bottom: 29.3.h,
              left: 16.w,
              right: 16.w,
              top: 16.h,
            ),
            width: 274.w,
            decoration: BoxDecoration(
              color: AppColor.kGreyColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8.h,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "20/12/2020",
                      style: AppTextStyle.subTitle.copyWith(
                        color: AppColor.kItemColor,
                      ),
                    ),

                    SvgPicture.asset(AppImages.assetsIconsMore),
                  ],
                ),
                Text("Great Food and Service", style: AppTextStyle.subTitle),
                CustomRating(),
                SizedBox(height: 8.h),
                Text(
                  "This Food so tasty & delicious. Breakfast so fast Delivered in my place. Chef is very friendly. I’m really like chef for Home Food Order. Thanks.  I would highly reommend this restaurant to anyone looking for a great dining experience.",
                  style: AppTextStyle.subTitle.copyWith(
                    overflow: TextOverflow.visible,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
