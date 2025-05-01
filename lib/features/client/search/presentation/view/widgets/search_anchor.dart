import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/ui/text_form_search.dart';
import 'package:food_app/features/client/home/cubit/category/category_cubit.dart';
import 'package:food_app/features/client/home/cubit/restaurant/restaurant_cubit.dart';

class CustomSearchAnchor extends StatelessWidget {
  const CustomSearchAnchor({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 327.w,
      height: 62.h,
      child: SearchAnchor(
        builder: (BuildContext context, SearchController controller) {
          return TextFormSearch(
            onChanged: (query) {
              BlocProvider.of<RestaurantCubit>(
                context,
              ).searchRestaurants(query);
              BlocProvider.of<CategoryCubit>(context).searchCategory(query);

            },
          );
        },
        suggestionsBuilder: (
          BuildContext context,
          SearchController controller,
        ) {
          return [Center(child: Text("Search"))];
        },
      ),
    );
  }
}
