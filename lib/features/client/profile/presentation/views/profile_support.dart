import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/features/client/profile/presentation/widgets/profile_card.dart';
import 'package:food_app/features/client/profile/presentation/widgets/profile_list_tile.dart';

class ProfileSupportView extends StatelessWidget {
  const ProfileSupportView({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileCard(
      child: Column(
        children: [
          ProfileListTile(
            icon: SvgPicture.asset(
              AppImages.assetsIconsProfileFaq,
              width: 18.w,
              height: 18.h,
            ),
            title: "FAQs",
            onPressed: () {},
          ),
          ProfileListTile(
            icon: SvgPicture.asset(
              AppImages.assetsIconsProfileReview,
              width: 18.w,
              height: 18.h,
            ),
            title: "Users Reviews",
            onPressed: () {},
          ),
          ProfileListTile(
            icon: SvgPicture.asset(
              AppImages.assetsIconsProfileSettings,
              width: 18.w,
              height: 18.h,
            ),
            title: "Settings",
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
