import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/utils/app_color.dart';

class MealSizeHeader extends StatelessWidget {
  final String size;
  final bool isSelected;
  final VoidCallback onPress;
  const MealSizeHeader({
    super.key,
    required this.size,
    required this.onPress,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color:
              isSelected
                  ? AppColor.kPrimaryColor
                  : Color.fromRGBO(240, 245, 250, 1),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
          child: Text(
            size,
            style: TextStyle(
              color: isSelected ? Colors.white : null,
              fontSize: isSelected ? 16.sp : 14.sp,
            ),
          ),
        ),
      ),
    );
  }
}
