import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/utils/app_color.dart';

class Buttons {
  static Widget fill({
    required void Function()? onPressed,
    required String label,
    Color? color,
    bool? isLoading,
    Color? backgroundColor,
    Color? textColor,
    double? width,
  }) => SizedBox(
    width: width ?? double.infinity,
    height: 56,
    child: ElevatedButton(
      onPressed: (isLoading ?? false) ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? AppColor.kPrimaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 0,
      ),
      child:
          (isLoading ?? false)
              ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
              : Text(
                label,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: textColor ?? Colors.white,
                ),
              ),
    ),
  );

  static Widget outline({
    required void Function()? onPressed,
    required String label,
  }) => ElevatedButton(onPressed: onPressed, child: Text(label));

  static Widget text({
    required void Function()? onPressed,
    required String label,
  }) => TextButton(onPressed: onPressed, child: Text(label, style: TextStyle(color: AppColor.kPrimaryColor)));
}
