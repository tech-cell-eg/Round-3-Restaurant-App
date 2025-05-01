import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/core/ui/custom_icon_image_avatar.dart';
import 'package:food_app/core/utils/app_color.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:food_app/core/utils/app_text_style.dart';
import 'package:food_app/features/client/food_burger/presentation/views/widget/custom_drop_menu.dart';

class AppBarFoodBurger extends StatelessWidget {
  const AppBarFoodBurger({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10.w,
      children: [
        CustomIconImageAvatar(
          image: AppImages.assetsIconsMenu,
          backColor: AppColor.kItemColor.withValues(alpha: 0.2),
        ),
        CustomDropMenu(),
        Spacer(),
        CustomIconImageAvatar(
          image: AppImages.assetsIconsSearch,
          backColor: AppColor.kBlackColor,
          colorImage: AppColor.kWhiteColor,
        ),
        CustomIconImageAvatar(
          image: AppImages.assetsIconsFilter,
          backColor: AppColor.kItemColor.withValues(alpha: 0.2),
        ),
      ],
    );
  }
}
