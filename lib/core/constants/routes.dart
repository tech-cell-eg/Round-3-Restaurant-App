import 'package:food_app/empty.dart';
import 'package:flutter/material.dart';
import 'package:food_app/features/auth/presentation/screens/forget_password.dart';
import 'package:food_app/features/auth/presentation/screens/login_screen.dart';
import 'package:food_app/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:food_app/features/auth/presentation/screens/verifiy_screen.dart';
import 'package:food_app/features/food_burger/presentation/views/food_burger_view.dart';
import 'package:food_app/features/home/presentation/view/home_view.dart';
import 'package:food_app/features/search/presentation/view/search_view.dart';
import 'package:food_app/features/onboarding/onboarding_screen.dart';

class Routes {
  static const home = "home";
  static const empty = "empty";
  static const login = "login";
  static const signup = "signup";
  static const forgotPassword = "forgot_password";
  static const verifyEmail = "verify_email";
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

      case signup:
        return MaterialPageRoute(builder: (_) => SignUpScreen());

      case forgotPassword:
        return MaterialPageRoute(builder: (_) => ForgetPassword());

      case verifyEmail: 
        return MaterialPageRoute(builder: (_) => VerifiyScreen());

      case home:
        return MaterialPageRoute(builder: (_) => HomeView());

      default:
        return MaterialPageRoute(builder: (_) => Scaffold());
    }
  }
}
