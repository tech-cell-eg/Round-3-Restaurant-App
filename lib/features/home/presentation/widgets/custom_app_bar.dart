import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/core/ui/custom_icon_image_avatar.dart';
import 'package:food_app/core/utils/app_color.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:food_app/core/utils/app_text_style.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 18.w,
      children: [
        CustomIconImageAvatar(
          image: AppImages.assetsIconsMenu,
          backColor: AppColor.kItemColor,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              "Deliver to",
              style: AppTextStyle.textStyle12.copyWith(
                color: AppColor.kPrimaryColor,
              ),
            ),
            Row(
              children: [
                Text("Halal Lab office", style: AppTextStyle.textStyle14),
                SvgPicture.asset(
                  AppImages.assetsIconsPolygon,
                  width: 11.w,
                  height: 10.h,
                ),
              ],
            ),
          ],
        ),
        Spacer(),
        Stack(
          children: [
            CustomIconImageAvatar(
              image: AppImages.assetsIconsMarketIcon,
              backColor: Colors.black,
            ),
            Positioned(
              left: 20,
              bottom: 22,
              child: CircleAvatar(
                radius: 9,
                backgroundColor: AppColor.kPrimaryColor,
                child: Text(
                  "2",
                  style: AppTextStyle.textStyle12.copyWith(
                    color: AppColor.kWhiteColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
