import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/core/utils/app_color.dart';
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
            style: AppTextStyle.title.copyWith(
              color: AppColor.kPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}

class CustomRow3 extends StatelessWidget {
  final String image1;
  final String image2;
  final String image3;
  final double size;

  const CustomRow3({
    super.key,
    required this.image1,
    required this.image2,
    required this.image3,
    this.size = 100,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildCircularSvg(image1),
        SizedBox(width: size * 0.2), // Add some spacing between circles
        _buildCircularSvg(image2),
        SizedBox(width: size * 0.2),
        _buildCircularSvg(image3),
      ],
    );
  }

  Widget _buildCircularSvg(String imagePath) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(shape: BoxShape.circle),
      child: ClipOval(child: SvgPicture.asset(imagePath, fit: BoxFit.cover)),
    );
  }
}
