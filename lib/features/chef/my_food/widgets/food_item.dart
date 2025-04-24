import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/core/utils/app_color.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:food_app/features/chef/my_food/model/food_model.dart';

Widget buildFoodItem(FoodItem item) {
  return Card(
    elevation: 0,
    color: Colors.white,
    margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
    child: Padding(
      padding: EdgeInsets.all(8.r),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Food Image
          Container(
            height: 80.h,
            width: 80.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(item.image),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
          SizedBox(width: 16.w),

          // Food Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name and More Icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        item.name,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    GestureDetector(
                      onTap: () {
                        // Add more options functionality
                      },
                      child: SvgPicture.asset(
                        AppImages.assetsIconsMoreVector,
                        width: 5.w,
                        height: 5.h,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),

                // Category and Price
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColor.kPrimaryColor.withAlpha(60),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Text(
                        item.category,
                        style: TextStyle(
                          color: AppColor.kPrimaryColor,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                    Text(
                      "\$${item.price.toStringAsFixed(2)}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                        color: AppColor.kPrimaryDark,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),

                // Rating and Pickup
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Rating
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: AppColor.kPrimaryColor,
                          size: 16.sp,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          item.rating.toStringAsFixed(1),
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColor.kPrimaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          "(${item.reviewCount} Reviews)",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColor.kItemColor,
                          ),
                        ),
                      ],
                    ),

                    // Pickup Button
                    Text(
                      "Pick UP",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColor.kItemColor,
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
