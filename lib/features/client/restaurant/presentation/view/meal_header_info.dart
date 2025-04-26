import 'package:flutter/material.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:food_app/core/utils/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/features/client/restaurant/presentation/widgets/icon_text.dart';

class MealHeaderInfoView extends StatelessWidget {
  final int time;
  final double rate;
  final String title, desc;
  const MealHeaderInfoView({
    super.key,
    required this.time,
    required this.rate,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.h,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(title, style: AppTextStyle.header),
        Text(
          desc,
          textAlign: TextAlign.justify,
          style: AppTextStyle.description,
        ),
        const SizedBox(height: 5),
        Row(
          spacing: 16.w,
          children: [
            IconText(
              icon: AppImages.assetsIconsStar,
              text: "$rate",
              bold: true,
            ),
            IconText(icon: AppImages.assetsIconsWatch, text: "$time min"),
          ],
        ),
      ],
    );
  }
}
