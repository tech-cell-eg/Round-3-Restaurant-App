import 'package:flutter/material.dart';
import 'package:food_app/core/utils/app_color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:food_app/core/utils/app_text_style.dart';

class AuthScreen extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget form;
  final double formHeightRatio;
  final bool showBackArrow;

  const AuthScreen({
    super.key,
    required this.title,
    required this.subtitle,
    required this.form,
    this.formHeightRatio = 0.66,
    this.showBackArrow = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height:
                      MediaQuery.of(context).size.height *
                      (1 - formHeightRatio),
                  decoration: const BoxDecoration(
                    color: AppColor.kPrimaryDark,
                    image: DecorationImage(
                      image: AssetImage(
                        AppImages.assetsImagesAuthBackgroundAsset,
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: AppTextStyle.header.copyWith(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          subtitle,
                          style: AppTextStyle.subTitle.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * formHeightRatio,
                  color: Colors.transparent,
                ),
              ],
            ),
            Positioned(
              top:
                  MediaQuery.of(context).size.height * (1 - formHeightRatio) -
                  30,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: form,
              ),
            ),
            if (showBackArrow)
              Positioned(
                top: MediaQuery.of(context).padding.top + 20,
                left: 20,
                child: GestureDetector(
                  onTap:(){}, 
                  //() => Navigator.of(context).pop(),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: AppColor.kGreyColor,
                    child: Center(
                      // Ensures the SVG is centered
                      child: SizedBox(
                        width: 24, // Adjust based on your needs
                        height: 24, // Adjust based on your needs
                        child: SvgPicture.asset(
                          AppImages.assetsIconsBack,
                          fit: BoxFit.contain, // Prevents overflow
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
