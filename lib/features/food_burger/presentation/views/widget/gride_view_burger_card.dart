import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:food_app/features/food_burger/presentation/views/widget/burger_card.dart';

class GridViewBurgerCard extends StatelessWidget {
  const GridViewBurgerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 0.0.h,
      ),
      itemBuilder: (context, index) {
        return BurgerCard(
          image: AppImages.assetsImagesFoodHamburger,
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
