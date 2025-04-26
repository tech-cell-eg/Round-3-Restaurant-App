import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/utils/app_color.dart';
import 'package:food_app/features/client/search/presentation/view/widgets/item_restaurant.dart';

class ListViewItemRestaurant extends StatelessWidget {
  const ListViewItemRestaurant({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 184.h,
      child: ListView.separated(
        itemBuilder: (context, index) => ItemRestaurant(),
        separatorBuilder:
            (context, index) =>
                Divider(color: AppColor.kItemColor, thickness: 0.4),
        itemCount: 8,
      ),
    );
  }
}
