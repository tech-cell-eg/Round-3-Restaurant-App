import 'package:flutter/material.dart';
import 'package:food_app/core/utils/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RestaurantCategoryHeader extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback? onPress;

  const RestaurantCategoryHeader({
    super.key,
    this.onPress,
    required this.label,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsetsDirectional.only(end: 8.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
          decoration: BoxDecoration(
            border:
                isSelected ? null : Border.all(width: 1.0, color: Colors.grey),
            borderRadius: BorderRadius.circular(20.r),
            color: isSelected ? AppColor.kPrimaryColor : Colors.transparent,
          ),
          child: Text(
            label,
            style: TextStyle(color: isSelected ? Colors.white : null, fontSize: isSelected ? 16.sp : 14.sp),
          ),
        ),
      ),
    );
  }
}
