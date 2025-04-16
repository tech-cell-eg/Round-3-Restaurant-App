import 'package:flutter/material.dart';
import 'package:food_app/features/auth/presentation/screens/login_screen.dart';
import 'package:food_app/features/home/presentation/view/home_view.dart';

class Routes {
  static const String main = "main";
  static const String login = "auth";
  static const String home = "auth";
  static const String basket = "basket";
  static const String allDishes = "all-dishes";
  static const String onboarding = "onboarding";
  static const String trackOrder = "track-order";
  static const String confirmOrder = "confirm-order";




   static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case login:
      return MaterialPageRoute(builder: (_) => LoginScreen());

    case home:
      return MaterialPageRoute(builder: (_) => HomeView());

    default:
      return MaterialPageRoute(builder: (_) => Scaffold());
  }
}
}



