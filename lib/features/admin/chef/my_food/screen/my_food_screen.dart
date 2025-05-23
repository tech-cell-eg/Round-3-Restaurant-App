import 'package:flutter/material.dart';
import 'package:food_app/core/utils/app_color.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:food_app/features/admin/chef/my_food/model/food_model.dart';
import 'package:food_app/features/admin/chef/my_food/widgets/food_list.dart';

class MyFoodScreen extends StatefulWidget {
  const MyFoodScreen({super.key});

  @override
  MyFoodScreenState createState() => MyFoodScreenState();
}

class MyFoodScreenState extends State<MyFoodScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<FoodItem> allFoodItems = [
    FoodItem(
      image: AppImages.assetsImagesPizza,
      name: "Chicken Thai Biriyani",
      category: "Breakfast",
      price: 60,
      rating: 4.9,
      reviewCount: 10,
    ),
    FoodItem(
      image: AppImages.assetsImagesPizza,
      name: "Chicken Bhuna",
      category: "Breakfast",
      price: 30,
      rating: 4.9,
      reviewCount: 10,
    ),
    FoodItem(
      image: AppImages.assetsImagesPizza,
      name: "Mazalichiken Halim",
      category: "Breakfast",
      price: 25,
      rating: 4.9,
      reviewCount: 10,
    ),
    FoodItem(
      image: AppImages.assetsImagesPizza,
      name: "Vegetable Salad",
      category: "Lunch",
      price: 15,
      rating: 4.5,
      reviewCount: 8,
    ),
    FoodItem(
      image: AppImages.assetsImagesPizza,
      name: "Beef Steak",
      category: "Dinner",
      price: 45,
      rating: 4.8,
      reviewCount: 12,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<FoodItem> getFilteredItems(int tabIndex) {
    if (tabIndex == 0) return allFoodItems; // All items
    String category = "";
    switch (tabIndex) {
      case 1:
        category = "Breakfast";
        break;
      case 2:
        category = "Lunch";
        break;
      case 3:
        category = "Dinner";
        break;
    }
    return allFoodItems.where((item) => item.category == category).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: "All"),
            Tab(text: "Breakfast"),
            Tab(text: "Lunch"),
            Tab(text: "Dinner"),
          ],
          labelColor: AppColor.kPrimaryColor,
          unselectedLabelColor: AppColor.kItemColor,
          indicatorColor: AppColor.kPrimaryColor,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          buildFoodList(getFilteredItems(0), context),
          buildFoodList(getFilteredItems(1), context),
          buildFoodList(getFilteredItems(2), context),
          buildFoodList(getFilteredItems(3), context),
        ],
      ),
    );
  }
}
