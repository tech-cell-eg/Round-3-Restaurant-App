import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/ui/buttons.dart';
import 'package:food_app/core/utils/app_text_style.dart';

final List<String> ingredients = [
  "Chicken",
  "Rice",
  "Spices",
  "Vegetables",
  "Curry Sauce",
];

class ItemDetailsScreen extends StatelessWidget {
  const ItemDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meal Details"),
        actions: [Buttons.text(onPressed: () {}, label: "EDIT")],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Column(
              spacing: 18.h,
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://hips.hearstapps.com/hmg-prod/images/creamy-pasta-burrata-7-1656098638.jpeg',
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Column(
                  spacing: 5.h,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Creamy Pasta Burrata", style: AppTextStyle.title),
                        Text("\$12.99", style: AppTextStyle.subTitle),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Pickup, Delivery", style: AppTextStyle.subTitle),
                        Row(
                          children: [
                            const Icon(Icons.star, color: Colors.orange),
                            Text(
                              "4.9 (12 reviews)",
                              style: AppTextStyle.subTitle,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      "lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                      textAlign: TextAlign.justify,
                      style: AppTextStyle.description,
                    ),
                  ],
                ),
                Column(
                  spacing: 5.h,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("INGREDIENTS"),
                    Wrap(
                      spacing: 2.w,
                      children:
                          ingredients.map((ingredient) {
                            return Chip(
                              label: Text(ingredient),
                              backgroundColor: Colors.blue[100],
                            );
                          }).toList(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
