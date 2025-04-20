import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/features/restaurant/model/meal.dart';
import 'package:food_app/features/restaurant/controller/meal_quantity_controller.dart';
import 'package:food_app/features/restaurant/presentation/widgets/meal_size_header.dart';

class MealSizeView extends StatelessWidget {
  final List<MealSize> sizes;
  final MealQuantityController controller;
  const MealSizeView({
    super.key,
    required this.sizes,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12.w,
      children: [
        const Text("SIZE: "),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: StatefulBuilder(
              builder:
                  (context, setState) => Row(
                    children:
                        sizes
                            .map(
                              (e) => MealSizeHeader(
                                size: e.size,
                                isSelected: e.id == controller.id,
                                onPress:
                                    () => setState(() => controller.size = e),
                              ),
                            )
                            .toList(),
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
