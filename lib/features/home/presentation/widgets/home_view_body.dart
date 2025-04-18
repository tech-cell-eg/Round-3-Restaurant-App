import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/constants/routes.dart';
import 'package:food_app/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:food_app/features/home/presentation/widgets/list_view_categories.dart';
import 'package:food_app/features/food_burger/presentaion/views/widget/list_view_item_open_retaurant.dart';
import 'package:food_app/features/home/presentation/widgets/message_welcome.dart';
import 'package:food_app/core/ui/text_form_search.dart';

import 'package:food_app/features/home/presentation/widgets/title_section_with_see_all.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            CustomAppBar(),
            SizedBox(height: 24.h),
            MessageWelcome(),
            SizedBox(height: 16.h),
            TextFormSearch(
              onTap: () {
                Navigator.pushReplacementNamed(context, Routes.search);
              },
            ),
            SizedBox(height: 32.h),
            TitleSectionWithSeeAll(titleSection: "All Categories"),
            SizedBox(height: 20.h),
            ListViewCategories(),
            SizedBox(height: 20.h),
            TitleSectionWithSeeAll(titleSection: "Open Restaurants"),
            SizedBox(height: 10.h),
            ListViewItemOpenRestaurant(),
          ],
        ),
      ),
    );
  }
}
