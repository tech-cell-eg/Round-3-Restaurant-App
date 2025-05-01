import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/features/client/food_burger/cubit/food_cubit.dart';
import 'package:food_app/features/client/food_burger/data/data_source/remote_food_data_source.dart';
import 'package:food_app/features/client/food_burger/data/repo/food_repo.dart';
import 'package:food_app/features/client/food_burger/presentation/views/widget/food_burger_view_body.dart';

class FoodBurgerView extends StatelessWidget {
  const FoodBurgerView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FoodCubit(FoodRepo(RemoteFoodDataSource())),
      child: Scaffold(body: SafeArea(child: FoodBurgerViewBody())),
    );
  }
}
