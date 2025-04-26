import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/utils/app_color.dart';
import 'package:food_app/core/utils/app_text_style.dart';
import 'package:food_app/core/utils/box_decoration_card.dart';
import 'package:food_app/features/admin/chef_home/presentation/views/widgets/custom_text_primary_color.dart';

class CardReviews extends StatelessWidget {
  const CardReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 94.18.h,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      decoration: boxDecorationCard(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Reviews", style: AppTextStyle.description),
              CustomTextPrimaryColor(title: "See All Reviews"),
            ],
          ),
          Row(
            spacing: 5.w,
            children: [
              Icon(Icons.star, color: AppColor.kPrimaryColor, size: 25.5.w),
              Text(
                "4.9",
                style: AppTextStyle.header.copyWith(
                  fontSize: 21,
                  color: AppColor.kPrimaryColor,
                ),
              ),
              SizedBox(width: 10.w),
              Text("Total 20 Reviews", style: AppTextStyle.description),
            ],
          ),
        ],
      ),
    );
  }
}
