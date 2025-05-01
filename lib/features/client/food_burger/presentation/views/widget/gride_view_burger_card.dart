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

        SizedBox(
          height: 420.h,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 45.w, // المسافة الأفقية بين العناصر
                mainAxisSpacing: 16.h, // المسافة العمودية بين العناصر
                childAspectRatio: 0.7, // نسبة العرض إلى الارتفاع لكل عنصر
              ),
              itemBuilder: (context, index) {
                return BurgerCard(
                  image: allCategories[index].image,
                  name: allCategories[index].name,
                  restaurant: allCategories[index].category,
                  price: allCategories[index].price,
                );
              },
              itemCount: allCategories.length,
            ),
          ),
        ),
      ],
    );
  }
}
