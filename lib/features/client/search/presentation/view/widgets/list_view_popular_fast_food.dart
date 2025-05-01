import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/features/client/home/cubit/category/category_cubit.dart';
import 'package:food_app/features/client/search/presentation/view/widgets/item_popular_fast_food.dart';

class ListViewItemPopularFastFood extends StatefulWidget {
  const ListViewItemPopularFastFood({super.key});

  @override
  State<ListViewItemPopularFastFood> createState() => _ListViewItemPopularFastFoodState();
}

class _ListViewItemPopularFastFoodState extends State<ListViewItemPopularFastFood> {
 
 List<dynamic> allCategories = [];

  @override
  void initState() {
    super.initState();
    allCategories = BlocProvider.of<CategoryCubit>(context).getAllCategories();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryCubit, CategoryState>(
      listener: (context, state) {
if (state is CategoryLoaded) {
          allCategories = state.category;
        } else if (state is CategoryError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: Colors.red),
          );
        } else if (state is CategoryLoading) {
          Center(child: CircularProgressIndicator());
        }        },
      builder: (context, state) {
        return SizedBox(
          height: 144.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => ItemPopularFastFood(
              categoryModel: allCategories[index],),
            separatorBuilder: (context, index) => SizedBox(width: 10),
            itemCount: allCategories.length,
          ),
        );
      },
    );
  }
}
