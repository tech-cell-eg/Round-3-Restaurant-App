import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:food_app/core/utils/app_text_style.dart';
import 'package:food_app/core/utils/box_decoration_card.dart';
import 'package:food_app/features/chef_home/presention/views/widgets/Custom_box_card.dart';
import 'package:food_app/features/chef_home/presention/views/widgets/card_popular_item.dart';
import 'package:food_app/features/chef_home/presention/views/widgets/card_reviews.dart';
import 'package:food_app/features/chef_home/presention/views/widgets/custom_app_bar_chef_home.dart';
import 'package:food_app/features/chef_home/presention/views/widgets/custom_card_char.dart';

class ChefHomeViewBody extends StatelessWidget {
  const ChefHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40.h),
            CustomAppBarChefHome(),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomBoxCard(number: '20', title: "Running Orders"),
                CustomBoxCard(number: '05', title: "Order Request"),
              ],
            ),
            SizedBox(height: 20.h),
            CustomCardChar(),
            SizedBox(height: 20.h),
            CardReviews(),
            SizedBox(height: 20.h),
            CardPopularItems(),
          ],
        ),
      ),
    );
  }
}
