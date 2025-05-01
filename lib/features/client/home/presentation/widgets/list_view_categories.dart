import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/features/client/home/cubit/category/category_cubit.dart';
import 'package:food_app/features/client/home/presentation/widgets/category_item.dart';

class ListViewCategories extends StatefulWidget {
  const ListViewCategories({super.key});

  @override
  State<ListViewCategories> createState() => _ListViewCategoriesState();
}

class _ListViewCategoriesState extends State<ListViewCategories> {
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
        }      },
      builder: (context, state) {
        return SizedBox(
          height: 60.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: allCategories.length,
            itemBuilder: (context, index) {
              return CategoryItem(category: allCategories[index], index: index);
            },
            separatorBuilder:
                (BuildContext context, int index) => SizedBox(width: 5.w),
          ),
        );
      },
    );
  }
}
