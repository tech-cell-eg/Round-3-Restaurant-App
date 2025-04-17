import 'package:flutter/material.dart';
import 'package:food_app/core/utils/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/features/onboarding/model/onboarding_model.dart';

class OnboardingView extends StatelessWidget {
  final OnboardingModel model;
  const OnboardingView(this.model, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          Image.asset(
            model.image,
            scale: .5,
            fit: BoxFit.cover,
          ),
          Text(
            model.title,
            style: AppTextStyle.textStyle12.copyWith(
              color: Colors.black,
              fontSize: 20.sp,
            ),
          ),
          Text(
            model.description,
            style: AppTextStyle.textStyle20.copyWith(
              color: Colors.grey,
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}
