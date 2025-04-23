import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/features/chef/food/controllers/ingredient_controller.dart';
import 'package:food_app/features/chef/food/presentation/sections/ingredients_basic_section.dart';
import 'package:food_app/features/chef/food/presentation/sections/ingredients_fruits_section.dart';
import 'package:food_app/features/chef/food/presentation/sections/ingredients_spices_section.dart';

class AddItemIngredientsView extends StatelessWidget {
  final IngredientController basicController,
      spicesController,
      fruitsController;

  const AddItemIngredientsView({
    super.key,
    required this.basicController,
    required this.spicesController,
    required this.fruitsController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
          child: Text("INGREDIENTS"),
        ),
        Column(
          children: [
            // Basic Ingredients Section
            BasicIngredientsSection(controller: basicController),

            // Spices Ingredients Section
            SpicesIngredientsSection(controller: spicesController),

            // Fruit Ingredients Section
            FruitsIngredientsSection(controller: fruitsController),
          ],
        ),
      ],
    );
  }
}
