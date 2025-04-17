import 'package:food_app/empty.dart';
import 'package:flutter/material.dart';
import 'package:food_app/features/auth/presentation/screens/login_screen.dart';
import 'package:food_app/features/home/presentation/view/home_view.dart';
import 'package:food_app/features/search/presention/view/search_view.dart';
import 'package:food_app/features/home/presentation/widgets/search_anchor.dart';
import 'package:food_app/features/onboarding/onboarding_screen.dart';

class Routes {
  static const String empty = "empty";
  static const String login = "login";
  static const String home = "home";
  static const String search = "search";
  static const String onboard = "onboard";

  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case empty:
        return MaterialPageRoute(builder: (_) => EmptyScreen());

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
