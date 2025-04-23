import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/features/profile/presentation/widgets/profile_card.dart';
import 'package:food_app/features/profile/presentation/widgets/profile_list_tile.dart';

class ProfileShippingAndActivityView extends StatelessWidget {
  const ProfileShippingAndActivityView({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileCard(
      child: Column(
        children: [
          ProfileListTile(
            icon: SvgPicture.asset(
              AppImages.assetsIconsProfileCart,
              width: 18.w,
              height: 18.h,
            ),
            title: "Cart",
            onPressed: () {},
          ),
          ProfileListTile(
            icon: SvgPicture.asset(
              AppImages.assetsIconsProfileFavorite,
              width: 18.w,
              height: 18.h,
            ),
            title: "Favorite",
            onPressed: () {},
          ),
          ProfileListTile(
            icon: SvgPicture.asset(
              AppImages.assetsIconsProfileNotification,
              width: 20.w,
              height: 20.h,
            ),
            title: "Notifications",
            onPressed: () {},
          ),
          ProfileListTile(
            icon: SvgPicture.asset(
              AppImages.assetsIconsProfileCreditCard,
              width: 18.w,
              height: 18.h,
            ),
            title: "Payment Method",
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
