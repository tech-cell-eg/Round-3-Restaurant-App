import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/utils/app_color.dart';
import 'package:food_app/core/utils/app_text_style.dart';

class BurgerCard extends StatelessWidget {
  final String image;
  final String name;
  final String restaurant;
  final double price;

  const BurgerCard({
    super.key,
    required this.image,
    required this.name,
    required this.restaurant,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160.h,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 40.h,
            child: Card(
              elevation: 0.1,
              color: AppColor.kWhiteColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Container(
                width: 153.w,
                height: 140.h,
                padding: EdgeInsets.only(top: 50.h, left: 10.w, right: 10.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      name,
                      style: AppTextStyle.subTitle,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      restaurant,
                      style: AppTextStyle.description.copyWith(
                        color: AppColor.kItemColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${price.toStringAsFixed(0)}',
                          style: AppTextStyle.title,
                        ),
                        FloatingActionButton(
                          onPressed: () {},
                          mini: true,
                          backgroundColor: Colors.orange,
                          child: Icon(Icons.add, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                image,
                width: 122.w,
                height: 84.h,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
