import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/utils/app_text_style.dart';
import 'package:food_app/features/client/home/data/model/categpry_model.dart';

class CustomItemKeyWords extends StatelessWidget {
  const CustomItemKeyWords({super.key, required this.categoryModel});

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 89.w,
      height: 46.h,
      decoration: BoxDecoration(
        border: Border.all(width: 0.3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: FittedBox(
        child: Text(
          textAlign: TextAlign.center
          ,categoryModel.name, style: AppTextStyle.description)),
    );
  }
}
