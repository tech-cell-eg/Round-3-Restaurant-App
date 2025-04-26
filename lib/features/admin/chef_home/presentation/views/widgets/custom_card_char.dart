import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/core/utils/app_color.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:food_app/core/utils/app_text_style.dart';
import 'package:food_app/core/utils/box_decoration_card.dart';
import 'package:food_app/features/admin/chef_home/presentation/views/widgets/custom_char_review.dart';
import 'package:food_app/features/admin/chef_home/presentation/views/widgets/custom_section_time_char.dart';
import 'package:food_app/features/admin/chef_home/presentation/views/widgets/custom_text_primary_color.dart';

class CustomCardChar extends StatelessWidget {
  const CustomCardChar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      decoration: boxDecorationCard(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text("Total Revenue", style: AppTextStyle.description),
                  Text(
                    "\$2,241",
                    style: AppTextStyle.header.copyWith(fontSize: 22),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColor.kItemColor.withValues(alpha: 0.2),
                    width: 1.w,
                  ),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  spacing: 5.w,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Daily", style: AppTextStyle.description),
                    SvgPicture.asset(
                      AppImages.assetsIconsUnderArrow,
                      width: 10.w,
                      height: 10.h,
                    ),
                  ],
                ),
              ),
              CustomTextPrimaryColor(title: "See Details"),
            ],
          ),

          CustomCharReview(),
          CustomSectionTimeChar(),
        ],
      ),
    );
  }
}
