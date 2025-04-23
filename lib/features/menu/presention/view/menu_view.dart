import 'package:flutter/material.dart';
import 'package:food_app/features/menu/presention/view/widget/menu_view_body.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: MenuViewBody()));
  }
}
