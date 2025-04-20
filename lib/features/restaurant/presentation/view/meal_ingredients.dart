import 'package:flutter/material.dart';
import 'package:food_app/core/utils/app_text_style.dart';

class MealIngredientsView extends StatelessWidget {
  final List<String> ingredients;
  const MealIngredientsView(this.ingredients, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text("INGREDIENTS", style: AppTextStyle.subTitle),
        Text(ingredients.join(", "), style: AppTextStyle.subTitle),
      ],
    );
  }
}
