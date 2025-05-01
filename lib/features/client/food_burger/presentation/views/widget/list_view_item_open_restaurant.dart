import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/features/client/food_burger/presentation/views/widget/card_item_open_restaurant.dart';
import 'package:food_app/features/client/home/cubit/restaurant/restaurant_cubit.dart';
import 'package:food_app/features/client/home/data/model/resturnat_model.dart';

class ListViewItemOpenRestaurant extends StatefulWidget {
  const ListViewItemOpenRestaurant({super.key});

  @override
  State<ListViewItemOpenRestaurant> createState() =>
      _ListViewItemOpenRestaurantState();
}

class _ListViewItemOpenRestaurantState
    extends State<ListViewItemOpenRestaurant> {
  List<RestaurantModel> getAllRestaurants = [];
  @override
  void initState() {
    super.initState();
  
        BlocProvider.of<RestaurantCubit>(context).getAllRestaurants();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RestaurantCubit, RestaurantState>(
      listener: (context, state) {
        if (state is RestaurantLoaded) {
          getAllRestaurants = state.restaurant;
        } else if (state is RestaurantError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: Colors.red),
          );
        } else if (state is RestaurantLoading) {
          Center(child: CircularProgressIndicator());
        }
      },
      builder: (context, state) {
        return ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return CardItemOpenRestaurant(
              restaurantModel: getAllRestaurants[index],
            );
          },
          separatorBuilder: (context, index) => SizedBox(height: 28.h),
          itemCount: getAllRestaurants.length,
        );
      },
    );
  }
}
