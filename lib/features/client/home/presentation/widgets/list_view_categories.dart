import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/features/client/home/presentation/widgets/category_item.dart';

class ListViewCategories extends StatelessWidget {
  const ListViewCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return CategoryItem();
        },
        separatorBuilder:
            (BuildContext context, int index) => SizedBox(width: 5.w),
      ),
    );
  }
}
