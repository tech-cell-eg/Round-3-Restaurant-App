 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/utils/app_color.dart' show AppColor;

BoxDecoration boxDecorationCard() {
    return BoxDecoration(
      color: AppColor.kGreyColor.withValues(alpha: 0.2),
      borderRadius: BorderRadius.circular(20.r),
      border: Border.all(
        width: 1.w,
        color: AppColor.kItemColor.withValues(alpha: 0.2),
      ),
    );
  }