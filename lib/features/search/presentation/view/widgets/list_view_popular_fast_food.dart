import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/features/search/presentation/view/widgets/item_popular_fast_food.dart';

class ListViewItemPopularFastFood extends StatelessWidget {
  const ListViewItemPopularFastFood({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 144.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => ItemPopularFastFood(),
        separatorBuilder: (context, index) => SizedBox(width: 10),
        itemCount: 6,
      ),
    );
  }
}
