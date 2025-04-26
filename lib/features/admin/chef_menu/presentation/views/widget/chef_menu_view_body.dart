import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/ui/custom_logout.dart';
import 'package:food_app/features/admin/chef_menu/presentation/views/widget/custom_card_persion_data_and_settings.dart';
import 'package:food_app/features/admin/chef_menu/presentation/views/widget/custom_header_page.dart';
import 'package:food_app/features/admin/chef_menu/presentation/views/widget/history_and_number_of_order.dart';
import 'package:food_app/features/admin/chef_menu/presentation/views/widget/user_reviews.dart';

class ChefMenuViewBody extends StatelessWidget {
  const ChefMenuViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 15.h,
        children: [
          CustomHeaderPage(),
          SizedBox(height: 24.h),
          CustomCardPersonDataAndSettings(),
          HistoryAndNumberOfOrder(),
          UserReviews(),

          CustomLogout(),
        ],
      ),
    );
  }
}
