import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/utils/app_color.dart';

class MealImage extends StatelessWidget {
  final String url;
  const MealImage(this.url, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          height: 175.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColor.kPrimaryColor,
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        Positioned(
          top: -65,
          child: Image.network(url, width: 250.w, height: 250.h),
        ),
        PositionedDirectional(
          bottom: 5,
          end: 5,
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite_outline, color: Colors.white),
            style: IconButton.styleFrom(
              backgroundColor: Color.fromRGBO(255, 203, 136, 1),
            ),
          ),
        ),
      ],
    );
  }
}
