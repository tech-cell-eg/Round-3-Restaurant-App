import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/utils/app_color.dart';
import 'package:food_app/features/client/home/cubit/restaurant/restaurant_cubit.dart';
import 'package:food_app/features/client/home/data/model/resturnat_model.dart';
import 'package:food_app/features/client/search/presentation/view/widgets/item_restaurant.dart';

class ListViewItemRestaurant extends StatefulWidget {
  const ListViewItemRestaurant({super.key});

  @override
  State<ListViewItemRestaurant> createState() => _ListViewItemRestaurantState();
}

class _ListViewItemRestaurantState extends State<ListViewItemRestaurant> {
 
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
        }      },
      builder: (context, state) {
        return SizedBox(
          height: 184.h,
          child: ListView.separated(
            itemBuilder: (context, index) => ItemRestaurant(restaurantModel: getAllRestaurants[index],),
            separatorBuilder:
                (context, index) =>
                    Divider(color: AppColor.kItemColor, thickness: 0.4),
            itemCount: getAllRestaurants.length,
          ),
        );
      },
    );
  }
}
