import 'package:flutter/material.dart';

class IngredientCard extends StatelessWidget {
  final String ingredient;
  final bool isSelected;
  final Function(String) toggleIngredient;

  const IngredientCard({
    super.key,
    required this.ingredient,
    required this.isSelected,
    required this.toggleIngredient,
  });

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor =
        isSelected
            ? Colors.blue.withOpacity(0.2)
            : Colors.grey.withOpacity(0.1);

    final Color borderColor = isSelected ? Colors.blue : Colors.grey;
    final Color textColor = isSelected ? Colors.blue[900]! : Colors.black87;

    return Padding(
      padding: const EdgeInsets.only(right: 5.0, bottom: 8.0),
      child: Material(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () => toggleIngredient(ingredient),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(color: borderColor),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              ingredient,
              style: TextStyle(color: textColor, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
