import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/features/restaurant/model/meal.dart';
import 'package:food_app/features/restaurant/presentation/view/meal_size.dart';
import 'package:food_app/features/restaurant/presentation/widgets/meal_image.dart';
import 'package:food_app/features/restaurant/presentation/view/meal_header_info.dart';
import 'package:food_app/features/restaurant/presentation/view/meal_ingredients.dart';
import 'package:food_app/features/restaurant/controller/meal_quantity_controller.dart';
import 'package:food_app/features/restaurant/presentation/widgets/meal_floating_bottom.dart';

class MealScreen extends StatefulWidget {
  final Meal meal;
  const MealScreen(this.meal, {super.key});

  @override
  State<MealScreen> createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  late MealQuantityController controller;

  @override
  void initState() {
    super.initState();
    controller = MealQuantityController(widget.meal.sizes.first);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: AnimatedBuilder(
        animation: controller,
        builder: (context, _) => MealFloatingBottom(controller),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              spacing: 16.h,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 30),
                MealImage(widget.meal.img),
                MealHeaderInfoView(
                  rate: widget.meal.rate,
                  time: widget.meal.time,
                  desc: widget.meal.desc,
                  title: widget.meal.name,
                ),
                MealSizeView(controller: controller, sizes: widget.meal.sizes),
                MealIngredientsView(widget.meal.ingredients),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
