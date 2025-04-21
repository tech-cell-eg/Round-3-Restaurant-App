import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:food_app/features/food_burger/presentaion/views/widget/burger_card.dart';

class GridViewBurgerCard extends StatelessWidget {
  const GridViewBurgerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7.h,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 0.0.h,
      ),
      itemBuilder: (context, index) {
        return BurgerCard(
          image: AppImages.assetsImagesFoodHomBurger,
          name: 'Burger Bistro',
          restaurant: 'Rose Garden',
          price: 40,
        );
      },
      itemCount: 4,
      shrinkWrap: true,
    );
  }
}
