import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/features/chef_home/presention/views/widgets/item_poular.dart';

class ListItemPopular extends StatelessWidget {
  const ListItemPopular({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => ItemPopular(),
        separatorBuilder:
            (BuildContext context, int index) =>
                SizedBox(width: 11.w),
      ),
    );
  }
}
