import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/features/client/restaurant/model/meal.dart';
import 'package:food_app/features/client/restaurant/model/category.dart';
import 'package:food_app/features/client/restaurant/presentation/widgets/meal_card.dart';
import 'package:food_app/features/client/restaurant/presentation/widgets/restaurant_category_header.dart';

final List<Category> categories = [
  Category(id: "burger", name: "Burger", img: "assets/images/burger.png"),
  Category(id: "pizza", name: "Pizza", img: "assets/images/pizza.png"),
  Category(id: "hotdog", name: "Hotdog", img: "assets/images/hotdog.png"),
  Category(id: "donut", name: "Donut", img: "assets/images/donut.png"),
  Category(id: "chicken", name: "Chicken", img: "assets/images/donut.png"),
  Category(id: "pasta", name: "Pasta", img: "assets/images/donut.png"),
  Category(id: "shawurma", name: "Shawurma", img: "assets/images/donut.png"),
];

class RestaurantsMealsView extends StatefulWidget {
  final List<Meal> meals;
  final List<String> categories;
  const RestaurantsMealsView({
    super.key,
    required this.meals,
    required this.categories,
  });

  @override
  State<RestaurantsMealsView> createState() => _RestaurantsMealsViewState();
}

class _RestaurantsMealsViewState extends State<RestaurantsMealsView> {
  String index = "all";
  late List<Meal> items;

  @override
  void initState() {
    items = widget.meals;
    super.initState();
  }

  void filterMeals(String id) {
    setState(() {
      index = id;
      if (id == "all") {
        items = widget.meals;
      } else {
        items =
            widget.meals.where((element) => element.category == id).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 8.h,
      children: [
        const SizedBox(height: 1),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: _buildMealsHeader(),
        ),
        if (index != "all")
          Text(
            "${categories.firstWhere((element) => element.id == index).name} (${items.length})",
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
          )
        else
          SizedBox(height: 5.h),
        GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            mainAxisSpacing: 15.h,
            crossAxisSpacing: 10.w,
          ),
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return MealCard(items[index]);
          },
        ),
      ],
    );
  }

  Row _buildMealsHeader() {
    return Row(
      children: [
        RestaurantCategoryHeader(
          label: "All",
          isSelected: index == "all",
          onPress: () => filterMeals("all"),
        ),
        ...widget.categories.map((categoryId) {
          final category = categories.firstWhere(
            (element) => element.id == categoryId,
            orElse: () => Category(id: categoryId, name: categoryId, img: ''),
          );
          return RestaurantCategoryHeader(
            label: category.name,
            isSelected: category.id == index,
            onPress: () => filterMeals(category.id),
          );
        }),
      ],
    );
  }
}
