import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/features/client/search/presentation/view/widgets/items_key_words.dart';

class ListViewItemKeyWords extends StatelessWidget {
  const ListViewItemKeyWords({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) => CustomItemKeyWords(),
        separatorBuilder: (context, index) => SizedBox(width: 10.w),
        itemCount: 10,
      ),
    );
  }
}
