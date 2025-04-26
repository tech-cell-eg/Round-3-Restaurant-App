import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/features/client/review/presentation/views/widget/custom_app_bar_review.dart';
import 'package:food_app/features/client/review/presentation/views/widget/custom_card_view.dart';

class ReviewViewBody extends StatelessWidget {
  const ReviewViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0.w),
        child: Column(
          children: [
            CustomAppBarReview(),

            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return CustomCardReview();
              },
              separatorBuilder: (context, index) => SizedBox(height: 10.h),
              itemCount: 10,
            ),
          ],
        ),
      ),
    );
  }
}



