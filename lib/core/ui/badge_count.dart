import 'package:flutter/material.dart';
import 'package:food_app/core/constants/routes.dart';
import 'package:food_app/core/ui/custom_icon_image_avatar.dart';
import 'package:food_app/core/utils/app_color.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:food_app/core/utils/app_text_style.dart';

class BadgeCount extends StatelessWidget {
  const BadgeCount({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, Routes.cart),
      child: Stack(
        children: [
          CustomIconImageAvatar(
            image: AppImages.assetsIconsMarket,
            colorImage: AppColor.kWhiteColor,
            backColor: AppColor.kPrimaryDark,
          ),
          Positioned(
            left: 20,
            bottom: 22,
            child: CircleAvatar(
              radius: 9,
              backgroundColor: AppColor.kPrimaryColor,
              child: Text(
                "2",
                style: AppTextStyle.label.copyWith(color: AppColor.kWhiteColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
