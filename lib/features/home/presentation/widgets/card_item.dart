import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/utils/app_color.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:food_app/core/utils/app_text_style.dart';
import 'package:food_app/features/home/presentation/widgets/icon_and_title.dart';

class CardItem extends StatelessWidget {
  const CardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.kWhiteColor,
      elevation: 0.0,
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6.r),
            child: Image.asset(AppImages.assetsImagesFood),
          ),
          Text("Rose garden restaurant", style: AppTextStyle.textStyle20),
          Text(
            'Burger - Chiken - Riche - Wings ',
            style: AppTextStyle.textStyle14.copyWith(
              color: AppColor.kItemColor,
            ),
          ),
          Row(
            spacing: 24.w,
            children: [
              IconImageAndTitle(
                image: AppImages.assetsImagesStar,
                title: "4.7",
              ),
              IconImageAndTitle(
                image: AppImages.assetsImagesDelivery,
                title: "Free",
              ),
              IconImageAndTitle(
                image: AppImages.assetsImagesClock,
                title: "20 min",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
