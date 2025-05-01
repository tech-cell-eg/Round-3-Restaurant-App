import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/ui/title_section.dart';
import 'package:food_app/features/client/food_burger/data/models/food_model.dart';
import 'package:food_app/features/client/food_burger/presentation/views/widget/burger_card.dart';

class GridViewMealCard extends StatelessWidget {
  const GridViewMealCard({super.key, required this.allCategories});
  final List<FoodMealsModel> allCategories;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 24.h,
      children: [
        TitleSection(title: "Popular Burgers"),
                
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7.h,
            crossAxisSpacing: 10.w,
            mainAxisSpacing: 0.0.h,
          ),
          itemBuilder: (context, index) {
            return BurgerCard(
              image:allCategories[index].image,
              name: allCategories[index].name,
              restaurant: allCategories[index].category,
              price: allCategories[index].price,
            );
          },
          itemCount: allCategories.length,
          shrinkWrap: true,
        ),
      ],
    );
  }
}
