import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/core/utils/app_color.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:food_app/core/utils/app_text_style.dart';

class AuthHeaderView extends StatelessWidget {
  final String title, subtitle;
  const AuthHeaderView({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColor.kPrimaryDark,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * (1 - .75),
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  AppImages.assetsIconsAuthEllipse,
                  colorFilter: ColorFilter.linearToSrgbGamma(),
                  width: 75.w,
                  height: 75.h,
                  fit: BoxFit.contain,
                ),
                SvgPicture.asset(
                  width: 200.w,
                  height: 200.h,
                  AppImages.assetsIconsAuthVector,
                  colorFilter: ColorFilter.linearToSrgbGamma(),
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Center(
              child: Column(
                spacing: 5.h,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.header.copyWith(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    subtitle,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.subTitle.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
