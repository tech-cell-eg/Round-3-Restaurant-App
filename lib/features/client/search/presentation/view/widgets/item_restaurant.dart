import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/ui/cached_network_image.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:food_app/core/utils/app_text_style.dart';
import 'package:food_app/features/client/home/data/model/resturnat_model.dart';
import 'package:food_app/features/client/home/presentation/widgets/icon_and_title.dart';

class ItemRestaurant extends StatelessWidget {
  const ItemRestaurant({super.key, required this.restaurantModel});
  final RestaurantModel restaurantModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10.w,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child:CustomCachedNetWorkImage(
            image: restaurantModel.imageUrl, 
            height: 44.h,
            width: 44.w,
            imageError:AppImages.assetsImagesRestaurant )
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10.h,
          children: [
            Text(restaurantModel.name, style: AppTextStyle.subTitle),
            IconImageAndTitle(image: AppImages.assetsIconsStar, title: "${restaurantModel.rating}"),
          ],
        ),
      ],
    );
  }
}
