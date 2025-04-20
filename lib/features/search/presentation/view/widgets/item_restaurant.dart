import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:food_app/core/utils/app_text_style.dart';
import 'package:food_app/features/home/presentation/widgets/icon_and_title.dart';

class ItemRestaurant extends StatelessWidget {
  const ItemRestaurant({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10.w,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            AppImages.assetsImagesRestaurant,
            height: 50.h,
            width: 60.w,
            fit: BoxFit.fill,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10.h,
          children: [
            Text("Pansi Restaurant", style: AppTextStyle.subTitle),
            IconImageAndTitle(image: AppImages.assetsIconsStar, title: "4.7"),
          ],
        ),
      ],
    );
  }
}
