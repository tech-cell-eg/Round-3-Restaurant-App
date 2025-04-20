import 'package:flutter/material.dart';
import 'package:food_app/core/ui/title_section.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/features/food_burger/presentation/views/widget/app_bar_food_burger.dart';
import 'package:food_app/features/food_burger/presentation/views/widget/gride_view_burger_card.dart';
import 'package:food_app/features/food_burger/presentation/views/widget/list_view_item_open_restaurant.dart';

class FoodBurgerViewBody extends StatelessWidget {
  const FoodBurgerViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.sp),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 24.h),

            AppBarFoodBurger(),
            SizedBox(height: 24.h),
            TitleSection(title: "Popular Burgers"),
            SizedBox(height: 24.h),
            GridViewBurgerCard(),
            TitleSection(title: "Open Restaurant"),
            SizedBox(height: 10.h),
            ListViewItemOpenRestaurant(),
          ],
        ),
      ),
    );
  }
}
