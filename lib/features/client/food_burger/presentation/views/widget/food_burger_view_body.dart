import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/ui/title_section.dart';
import 'package:food_app/features/client/food_burger/cubit/food_cubit.dart';
import 'package:food_app/features/client/food_burger/presentation/views/widget/app_bar_food_burger.dart';
import 'package:food_app/features/client/food_burger/presentation/views/widget/gride_view_burger_card.dart';
import 'package:food_app/features/client/food_burger/presentation/views/widget/list_view_item_open_restaurant.dart';

class FoodBurgerViewBody extends StatefulWidget {
  const FoodBurgerViewBody({super.key});

  @override
  State<FoodBurgerViewBody> createState() => _FoodBurgerViewBodyState();
}

class _FoodBurgerViewBodyState extends State<FoodBurgerViewBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<FoodCubit>(context).getAllCategories();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FoodCubit, FoodState>(
      listener: (context, state) {
        if (state is FoodError) {
          print("FoodBurgerViewBody: Error state received: ${state.message}");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: Colors.red),
          );
        }
      },
      builder: (context, state) {
        print("FoodBurgerViewBody: Building with state: $state");
        if (state is FoodLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FoodLoaded) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.sp, vertical: 10.sp),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 40.h),
                  AppBarFoodBurger(),
                  SizedBox(height: 24.h),
                  GridViewMealCard(allCategories: state.categories),
                  TitleSection(title: "Open Restaurant"),
                  SizedBox(height: 10.h),
                  ListViewItemOpenRestaurant(),
                ],
              ),
            ),
          );
        } else {
          print("FoodBurgerViewBody: No meals available (state: $state)");
          return const Center(child: Text('No meals available'));
        }
      },
    );
  }
}
