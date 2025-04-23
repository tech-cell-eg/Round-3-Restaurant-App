import 'package:flutter/material.dart';
import 'package:food_app/features/cheef_menu/presention/views/widget/chef_menu_view_body.dart';

class ChefMenuView extends StatelessWidget {
  const ChefMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: ChefMenuViewBody()));
  }
}
