import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:food_app/core/utils/box_decoration_card.dart';

class ItemPopular extends StatelessWidget {
  const ItemPopular({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 153.h,
      width: 150.w,
      decoration: boxDecorationCard(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: Image.asset(AppImages.assetsImagesRestaurant, fit: BoxFit.fill),
      ),
    );
  }
}