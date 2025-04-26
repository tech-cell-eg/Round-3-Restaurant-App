import 'package:flutter/material.dart';
import 'package:food_app/features/admin/chef/food/presentation/item_details_screen.dart';
import 'package:food_app/features/admin/chef/my_food/model/food_model.dart';
import 'package:food_app/features/admin/chef/my_food/widgets/food_item.dart';

Widget buildFoodList(List<FoodItem> items, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ItemDetailsScreen()),
      );
    },
    child: Column(
      children: [
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total ${items.length} items",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return buildFoodItem(items[index]);
            },
          ),
        ),
      ],
    ),
  );
}
