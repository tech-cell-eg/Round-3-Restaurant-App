import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/features/admin/chef_home/presentation/views/widgets/custom_box_card.dart';
import 'package:food_app/features/admin/chef_home/presentation/views/widgets/bottom_sheets.dart';
import 'package:food_app/features/admin/chef_home/presentation/views/widgets/card_popular_item.dart';
import 'package:food_app/features/admin/chef_home/presentation/views/widgets/card_reviews.dart';
import 'package:food_app/features/admin/chef_home/presentation/views/widgets/custom_card_char.dart';

class ChefHomeViewBody extends StatelessWidget {
  const ChefHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet<void>(
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return const ItemBottomSheet();
                      },
                    );
                  },
                  child: CustomBoxCard(number: '20', title: "Running Orders"),
                ),

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
