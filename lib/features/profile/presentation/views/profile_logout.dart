import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/features/profile/presentation/widgets/profile_card.dart';
import 'package:food_app/features/profile/presentation/widgets/profile_list_tile.dart';

class ProfileLogoutView extends StatelessWidget {
  const ProfileLogoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileCard(
      child: ProfileListTile(
        icon: SvgPicture.asset(
          AppImages.assetsIconsProfileLogout,
          width: 18.w,
          height: 18.h,
        ),
        title: "Logout",
        onPressed: () {},
      ),
    );
  }
}
