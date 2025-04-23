import 'package:flutter/material.dart';
import 'package:food_app/features/chef_home/presention/views/widgets/chef_home_view_body.dart';
import 'package:food_app/features/chef_home/presention/views/widgets/custom_bottom_nav_bar.dart';

class ChefHomeView extends StatelessWidget {
  const ChefHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(),

      body: SafeArea(child: ChefHomeViewBody()),
    );
  }
}
