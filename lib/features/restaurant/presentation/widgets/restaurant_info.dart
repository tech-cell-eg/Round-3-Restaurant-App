import 'package:flutter/material.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/features/restaurant/presentation/widgets/icon_text.dart';

class RestaurantInfo extends StatelessWidget {
  final int fees, time;
  final double rate;
  const RestaurantInfo({
    super.key,
    required this.fees,
    required this.time,
    required this.rate,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16.w,
      children: [
        IconText(icon: AppImages.assetsIconsStar, text: "$rate", bold: true),
        IconText(
          icon: AppImages.assetsIconsCar,
          text: fees == 0 ? "free" : fees.toString(),
        ),
        IconText(icon: AppImages.assetsIconsWatch, text: "$time min"),
      ],
    );
  }
}
