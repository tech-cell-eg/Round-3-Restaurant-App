import 'package:flutter/material.dart';
import 'package:food_app/features/food_burger/presentation/views/widget/food_burger_view_body.dart';

class FoodBurgerView extends StatelessWidget {
  const FoodBurgerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: FoodBurgerViewBody()));
  }
}
