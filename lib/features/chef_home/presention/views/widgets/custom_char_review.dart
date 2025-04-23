import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/core/utils/app_images.dart';

class CustomCharReview extends StatelessWidget {
  const CustomCharReview({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 109.h,
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: SvgPicture.asset(
              AppImages.assetsImagesChar,
              width: double.infinity,
              height: 74.h,
              fit: BoxFit.fill,
            ),
          ),

          Positioned(
            top: 25,
            right: 120,
            left: 5,
            bottom: 5,
            child: SvgPicture.asset(AppImages.assetsImagesLinear, height: 74.h),
          ),
          Positioned(
            top: 20,
            right: 120,
            left: 5,

            child: SvgPicture.asset(
              AppImages.assetsImagesCirculer,
              height: 13.h,
              width: 13.w,
            ),
          ),

          Positioned(
            right: 120,
            left: 5,
            bottom: 70,
            top: 0,

            child: SvgPicture.asset(AppImages.assetsImagesPrice),
          ),
        ],
      ),
    );
  }
}
