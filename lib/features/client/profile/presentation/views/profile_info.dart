import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:food_app/core/constants/routes.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/features/client/profile/presentation/widgets/profile_card.dart';
import 'package:food_app/features/client/profile/presentation/widgets/profile_list_tile.dart';

class ProfileInfoView extends StatelessWidget {
  const ProfileInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileCard(
      child: Column(
        children: [
          ProfileListTile(
            icon: SvgPicture.asset(
              AppImages.assetsIconsProfilePerson,
              width: 18.w,
              height: 18.h,
            ),
            title: "Personal Info",
            onPressed: () => Navigator.pushNamed(context, Routes.editProfile),
          ),
          ProfileListTile(
            icon: SvgPicture.asset(
              AppImages.assetsIconsProfileMap,
              width: 18.w,
              height: 18.h,
            ),
            title: "Addresses",
            onPressed: () {
              Navigator.pushNamed(context, Routes.address);
            },
          ),
        ],
      ),
    );
  }
}
