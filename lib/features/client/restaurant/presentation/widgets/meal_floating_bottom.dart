import 'package:flutter/material.dart';
import 'package:food_app/core/utils/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/features/client/restaurant/controller/meal_quantity_controller.dart';

class MealFloatingBottom extends StatelessWidget {
  final MealQuantityController controller;
  const MealFloatingBottom(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75.h,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(240, 245, 250, 1),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: StatefulBuilder(
          builder: (context, setState) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("\$${controller.total}", style: AppTextStyle.header),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(18, 18, 35, 1),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Row(
                    spacing: 8.w,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed:
                            controller.quantity == 1
                                ? null
                                : controller.decrement,
                        icon: Icon(Icons.remove, color: Colors.white),
                        style: IconButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size(30.w, 30.h),
                          backgroundColor: Color.fromRGBO(65, 65, 79, 1),
                        ),
                      ),
                      Text(
                        "${controller.quantity}",
                        style: TextStyle(color: Colors.white),
                      ),
                      IconButton(
                        onPressed: controller.increment,
                        icon: Icon(Icons.add, color: Colors.white),
                        style: IconButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size(30.w, 30.h),
                          backgroundColor: Color.fromRGBO(65, 65, 79, 1),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
