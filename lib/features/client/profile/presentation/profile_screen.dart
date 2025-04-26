import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:food_app/core/utils/app_text_style.dart';
import 'package:food_app/features/client/profile/presentation/views/profile_info.dart';
import 'package:food_app/features/client/profile/presentation/views/profile_logout.dart';
import 'package:food_app/features/client/profile/presentation/views/profile_shipping_and_activity.dart';
import 'package:food_app/features/client/profile/presentation/views/profile_support.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
          child: Column(
            spacing: 14.h,
            children: [
              Row(
                spacing: 10.w,
                children: [
                  CircleAvatar(
                    radius: 50.r,
                    backgroundImage: AssetImage(AppImages.assetsImagesUser),
                  ),
                  Expanded(
                    child: Column(
                      spacing: 5.h,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("John Doe", style: AppTextStyle.header),
                        Text(
                          "I love fast food 😋😋😋",
                          style: AppTextStyle.description,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const ProfileInfoView(),
              const ProfileShippingAndActivityView(),
              const ProfileSupportView(),
              const ProfileLogoutView(),
            ],
          ),
        ),
      ),
    );
  }
}
