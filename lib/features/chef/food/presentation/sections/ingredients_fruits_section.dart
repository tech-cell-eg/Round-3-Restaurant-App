import 'package:flutter/material.dart';
import 'package:food_app/core/ui/buttons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/features/chef/food/controllers/ingredient_controller.dart';
import 'package:food_app/features/chef/food/presentation/widgets/ingredient_card.dart';

final List<String> _ingredients = [
  "apple",
  "banana",
  "orange",
  "grape",
  "mango",
  "pineapple",
  "strawberry",
  "blueberry",
  "raspberry",
  "kiwi",
  "watermelon",
  "peach",
  "pear",
  "plum",
  "cherry",
];

class FruitsIngredientsSection extends StatefulWidget {
  final IngredientController controller;
  const FruitsIngredientsSection({super.key, required this.controller});

  @override
  State<FruitsIngredientsSection> createState() =>
      _FruitsIngredientsSectionState();
}

class _FruitsIngredientsSectionState extends State<FruitsIngredientsSection> {
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
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Fruits"),
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
