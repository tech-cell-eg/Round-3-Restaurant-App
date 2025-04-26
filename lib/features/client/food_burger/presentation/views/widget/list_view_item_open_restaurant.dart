import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/features/client/food_burger/presentation/views/widget/card_item_open_restaurant.dart';

class ListViewItemOpenRestaurant extends StatelessWidget {
  const ListViewItemOpenRestaurant({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return CardItemOpenRestaurant();
      },
      separatorBuilder: (context, index) => SizedBox(height: 28.h),
      itemCount: 10,
    );
  }
}
