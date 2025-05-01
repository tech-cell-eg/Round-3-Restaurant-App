import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/ui/cached_network_image.dart';
import 'package:food_app/core/utils/app_color.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:food_app/core/utils/app_text_style.dart';
import 'package:food_app/dummy/restaurant.dart';
import 'package:food_app/features/client/home/data/model/resturnat_model.dart';
import 'package:food_app/features/client/home/presentation/widgets/icon_and_title.dart';
import 'package:food_app/features/client/restaurant/presentation/restaurant_screen.dart';

class CardItemOpenRestaurant extends StatelessWidget {
  const CardItemOpenRestaurant({super.key, required this.restaurantModel});

  final RestaurantModel restaurantModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:
          () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RestaurantScreen(restaurants[0]),
            ),
          ),
      child: Card(
        color: AppColor.kWhiteColor,
        elevation: 0.0,
        child: Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: CustomCachedNetWorkImage(
                image: restaurantModel.imageUrl,
                height: 137.h,
                width: double.infinity,
                imageError: AppImages.assetsImagesFoodVegetables,
              ),
            ),
            Text(restaurantModel.name, style: AppTextStyle.header),
            Text(
              restaurantModel.des,
              style: AppTextStyle.description.copyWith(
                color: AppColor.kItemColor,
              ),
            ),
            Row(
              spacing: 24.w,
              children: [
                IconImageAndTitle(
                  image: AppImages.assetsIconsStar,
                  title: "${restaurantModel.rating}",
                ),
                IconImageAndTitle(
                  image: AppImages.assetsIconsDelivery,
                  title: "${restaurantModel.deliveryFees}",
                ),
                IconImageAndTitle(
                  image: AppImages.assetsIconsClock,
                  title: "${restaurantModel.deliveryTime}",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
