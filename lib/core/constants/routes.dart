import 'package:food_app/empty.dart';
import 'package:flutter/material.dart';
import 'package:food_app/features/auth/presentation/screens/login_screen.dart';
import 'package:food_app/features/food_burger/presentaion/views/food_burger_view.dart';
import 'package:food_app/features/home/presentation/view/home_view.dart';
import 'package:food_app/features/search/presention/view/search_view.dart';
import 'package:food_app/features/onboarding/onboarding_screen.dart';

class Routes {
  static const empty = "empty";
  static const login = "login";
  static const home = "home";
  static const search = "search";
  static const onboard = "onboard";
  static const foodBurger = "food_burger";
  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case empty:
        return MaterialPageRoute(builder: (_) => EmptyScreen());

      case foodBurger:
        return MaterialPageRoute(builder: (_) => FoodBurgerView());

      case onboard:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());

      case search:
        return MaterialPageRoute(builder: (_) => SearchView());

      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      case home:
        return MaterialPageRoute(builder: (_) => HomeView());

      default:
        return MaterialPageRoute(builder: (_) => Scaffold());
    }
  }
}
