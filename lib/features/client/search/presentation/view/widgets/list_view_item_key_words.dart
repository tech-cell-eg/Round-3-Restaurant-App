import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/features/client/home/cubit/category/category_cubit.dart';
import 'package:food_app/features/client/search/presentation/view/widgets/items_key_words.dart';

class ListViewItemKeyWords extends StatefulWidget {
  const ListViewItemKeyWords({super.key});

  @override
  State<ListViewItemKeyWords> createState() => _ListViewItemKeyWordsState();
}

class _ListViewItemKeyWordsState extends State<ListViewItemKeyWords> {
 
 
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
        }       },
      builder: (context, state) {
        return SizedBox(
          height: 46.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) => CustomItemKeyWords(categoryModel: allCategories[index],),
            separatorBuilder: (context, index) => SizedBox(width: 10.w),
            itemCount: allCategories.length,
          ),
        );
      },
    );
  }
}
