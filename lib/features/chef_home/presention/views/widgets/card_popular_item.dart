import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/utils/box_decoration_card.dart';
import 'package:food_app/features/chef_home/presention/views/widgets/custom_title_card_poplar.dart';
import 'package:food_app/features/chef_home/presention/views/widgets/list_item_popular.dart';

class CardPopularItems extends StatelessWidget {
  const CardPopularItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.h,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      width: double.infinity,
      decoration: boxDecorationCard(),
      child: Column(
        spacing: 10.h,
        children: [
          CustomTitleCardPopular(),
          ListItemPopular(),
        ],
      ),
    );
  }
}