import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/core/utils/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/features/restaurant/model/restaurant.dart';
import 'package:food_app/features/chat/presentation/chat_screen.dart';
import 'package:food_app/features/restaurant/presentation/view/restaurant_meals.dart';
import 'package:food_app/features/restaurant/presentation/widgets/restaurant_info.dart';

class RestaurantScreen extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantScreen(this.restaurant, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        onPressed:
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (_) => ChatScreen(
                      restaurant.id,
                      restaurantName: restaurant.name,
                    ),
              ),
            ),
        child: Icon(CupertinoIcons.chat_bubble_2_fill),
      ),
      body: SingleChildScrollView(
        child: Column(
          spacing: 8.h,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(25.r),
              ),
              child: Image.network(
                restaurant.img,
                fit: BoxFit.fill,
                height: 350.h,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Column(
                spacing: 14.h,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  RestaurantInfo(
                    rate: restaurant.rate,
                    fees: restaurant.deliveryFees,
                    time: restaurant.deliveryTime,
                  ),
                  Column(
                    spacing: 4.h,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(restaurant.name, style: AppTextStyle.header),
                      Text(
                        restaurant.desc,
                        textAlign: TextAlign.justify,
                        style: AppTextStyle.subTitle,
                      ),
                    ],
                  ),
                  RestaurantsMealsView(
                    meals: restaurant.meals,
                    categories: restaurant.categories,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
