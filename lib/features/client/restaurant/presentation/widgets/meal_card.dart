import 'package:flutter/material.dart';
import 'package:food_app/core/utils/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/features/client/restaurant/model/meal.dart';
import 'package:food_app/features/client/restaurant/presentation/meal_screen.dart';

class MealCard extends StatelessWidget {
  final Meal meal;
  const MealCard(this.meal, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => MealScreen(meal)),
          ),
      child: Card(
        elevation: 10,
        margin: EdgeInsets.zero,
        child: Column(
          children: [
            Image.network(
              meal.img,
              fit: BoxFit.cover,
              height: 125.h,
              width: double.maxFinite,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(meal.name, overflow: TextOverflow.ellipsis),
                  Text(meal.desc, overflow: TextOverflow.ellipsis),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("\$${meal.sizes[0].price}"),

                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.add, size: 20.sp),
                        color: Colors.white,
                        style: IconButton.styleFrom(
                          backgroundColor: AppColor.kPrimaryColor,
                          padding: EdgeInsets.zero,
                          minimumSize: Size(30.w, 30.h),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
