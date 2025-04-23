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
    double? height,
    double? fontSize,
  }) => SizedBox(
    width: width ?? double.infinity,
    height: height ?? 56,
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
                  fontSize: fontSize ?? 20.sp,
                  fontWeight: FontWeight.w600,
                  color: textColor ?? Colors.white,
                ),
              ),
    ),
  );

  static Widget outline({
    required void Function()? onPressed,
    required String label,
    Color? color,
    bool? isLoading,
    Color? backgroundColor,
    Color? textColor,
    double? width,
    double? height,
    double? fontSize,
  }) => SizedBox(
    width: width ?? double.infinity,
    height: height ?? 56,
    child: OutlinedButton(
      onPressed: (isLoading ?? false) ? null : onPressed,
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: AppColor.kPrimaryColor),
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
                  fontSize: fontSize ?? 20.sp,
                  fontWeight: FontWeight.w600,
                  color: textColor ?? AppColor.kPrimaryColor,
                ),
              ),
    ),
  );

  static Widget text({
    required void Function()? onPressed,
    required String label,
  }) => TextButton(onPressed: onPressed, child: Text(label));
}
