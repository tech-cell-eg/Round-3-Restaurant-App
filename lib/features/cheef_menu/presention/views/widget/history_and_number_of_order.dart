import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/ui/custom_icon_image_avatar.dart';
import 'package:food_app/core/ui/custom_section_menu.dart';
import 'package:food_app/core/utils/app_color.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:food_app/core/utils/app_text_style.dart';

class HistoryAndNumberOfOrder extends StatelessWidget {
  const HistoryAndNumberOfOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      height: 136.h,
      width: 327.w,
      decoration: BoxDecoration(
        color: AppColor.kGreyColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        children: [
          CustomSectionMenu(
            title: 'Withdrawal History',
            image: AppImages.assetsIconsWithdrawal,
            colorImage: AppColor.kPrimaryColor,
          ),
          SizedBox(height: 16.h),
          Row(
            spacing: 11.w,
            children: [
              CustomIconImageAvatar(
                image: AppImages.assetsIconsNumberoforder,
                backColor: AppColor.kWhiteColor,
                colorImage: Color(0xff413DFB),
              ),
              Text('Number of Orders', style: AppTextStyle.textStyle16),
              Spacer(),
              Text(
                '29K',
                style: AppTextStyle.textStyle16.copyWith(
                  color: AppColor.kItemColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
