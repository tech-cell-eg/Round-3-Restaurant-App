import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/ui/title_section.dart';
import 'package:food_app/features/search/presentation/view/widgets/list_view_item_key_words.dart';
import 'package:food_app/features/search/presentation/view/widgets/list_view_item_restaurant.dart';
import 'package:food_app/features/search/presentation/view/widgets/list_view_popular_fast_food.dart';
import 'package:food_app/features/search/presentation/view/widgets/search_anchor.dart';
import 'package:food_app/features/search/presentation/view/widgets/custom_app_bar_search.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.r),
      child: Column(
        children: [
          SizedBox(height: 20.h),
          CustomAppBarSearch(),
          SizedBox(height: 24.h),
          CustomSearchAnchor(),
          SizedBox(height: 24.h),
          Align(
            alignment: Alignment.bottomLeft,
            child: TitleSection(title: "Recent Keywords"),
          ),
          SizedBox(height: 12.h),
          ListViewItemKeyWords(),
          SizedBox(height: 12.h),
          Align(
            alignment: Alignment.bottomLeft,
            child: TitleSection(title: "Suggested Restaurants"),
          ),
          SizedBox(height: 12.h),
          ListViewItemRestaurant(),
          
          SizedBox(height: 32.h),
          Align(
            alignment: Alignment.bottomLeft,
            child: TitleSection(title: "Popular Fast food"),
          ),
          SizedBox(height: 27.h),
          ListViewItemPopularFastFood(),
        ],
      ),
    );
  }
}
