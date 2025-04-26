import 'package:flutter/material.dart';
import 'package:food_app/core/ui/buttons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/features/admin/chef/food/controllers/ingredient_controller.dart';
import 'package:food_app/features/admin/chef/food/presentation/widgets/ingredient_card.dart';

final List<String> _ingredients = [
  "salt",
  "pepper",
  "onion",
  "garlic",
  "ginger",
  "tomato",
  "chilli",
  "green chilli",
  "cabbage",
  "carrot",
  "potato",
  "broccoli",
  "spinach",
  "cauliflower",
  "bell pepper",
  "zucchini",
  "eggplant",
];

class BasicIngredientsSection extends StatefulWidget {
  final IngredientController controller;
  const BasicIngredientsSection({super.key, required this.controller});

  @override
  State<BasicIngredientsSection> createState() =>
      _BasicIngredientsSectionState();
}

class _BasicIngredientsSectionState extends State<BasicIngredientsSection> {
  bool openMenu = false;
  void toggleIngredient(String ingredient) {
    setState(() {
      widget.controller.value.contains(ingredient)
          ? widget.controller.value.remove(ingredient)
          : widget.controller.value.add(ingredient);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Basic"),
              Buttons.text(
                onPressed: () => setState(() => openMenu = !openMenu),
                label: openMenu ? "close" : "see all",
              ),
            ],
          ),
        ),
        openMenu
            ? Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              child: Wrap(
                children:
                    _ingredients
                        .map(
                          (ingredient) => IngredientCard(
                            ingredient: ingredient,
                            isSelected: widget.controller.value.contains(
                              ingredient,
                            ),
                            toggleIngredient: toggleIngredient,
                          ),
                        )
                        .toList(),
              ),
            )
            : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(width: 14),
                  ..._ingredients
                      .take(5)
                      .map(
                        (ingredient) => IngredientCard(
                          ingredient: ingredient,
                          isSelected: widget.controller.value.contains(
                            ingredient,
                          ),
                          toggleIngredient: toggleIngredient,
                        ),
                      ),
                ],
              ),
            ),
      ],
    );
  }
}
