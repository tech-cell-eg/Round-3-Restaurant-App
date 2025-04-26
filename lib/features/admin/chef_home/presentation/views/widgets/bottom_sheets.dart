import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/utils/app_text_style.dart';
import 'package:food_app/features/admin/chef_home/presentation/views/widgets/running_order_card.dart';

class ItemBottomSheet extends StatelessWidget {
  const ItemBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.75,
      child: Padding(
        padding: EdgeInsets.only(top: 2.0, left: 10.w, right: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 5.h,
                width: 75.w,
                margin: EdgeInsets.only(top: 10.h),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: Text(
                      "20 Running Orders",
                      style: AppTextStyle.title.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  ...List.generate(5, (_) => RunningOrderCard()),
                  const SizedBox(height: 5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
