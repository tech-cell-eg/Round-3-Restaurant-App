import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/core/utils/app_color.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:food_app/core/utils/app_text_style.dart';

class CustomRow extends StatelessWidget {
  final String textButtonText;
  final String checkboxText;
  final VoidCallback onPressed;
  const CustomRow({
    super.key,
    required this.textButtonText,
    required this.checkboxText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(
              value: false,
              onChanged: (value) {},
              activeColor: AppColor.kPrimaryDark,
            ),
            Text(
              checkboxText,
              style: AppTextStyle.subTitle.copyWith(color: AppColor.kItemColor),
            ),
          ],
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            textButtonText,
            style: AppTextStyle.subTitle.copyWith(
              color: AppColor.kPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}

class CustomRow2 extends StatelessWidget {
  final String textButtonText;
  final String text;
  final VoidCallback onPressed;
  const CustomRow2({
    super.key,
    required this.textButtonText,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: AppTextStyle.title.copyWith(color: AppColor.kItemColor),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            textButtonText,
            style: AppTextStyle.title.copyWith(color: AppColor.kPrimaryColor),
          ),
        ),
      ],
    );
  }
}

class SocialLoginOption extends StatelessWidget {
  const SocialLoginOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10.w,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildCircularIcon(
          path: AppImages.assetsIconsAuthFacebook,
          color: Color.fromRGBO(57, 89, 152, 1),
        ),
        _buildCircularIcon(
          path: AppImages.assetsIconsAuthTwitter,
          color: Color.fromRGBO(22, 156, 232, 1),
        ),
        _buildCircularIcon(
          path: AppImages.assetsIconsAuthApple,
          color: Color.fromRGBO(27, 31, 47, 1),
        ),
      ],
    );
  }

  Widget _buildCircularIcon({required String path, required Color color}) {
    return CircleAvatar(
      radius: 35,
      backgroundColor: color,
      child: Center(
        child: SvgPicture.asset(
          path,
          width: 25.w,
          height: 25.h,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
