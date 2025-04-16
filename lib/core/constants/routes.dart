import 'package:food_app/empty.dart';
import 'package:flutter/material.dart';
import 'package:food_app/features/auth/presentation/screens/login_screen.dart';

class Routes {
  static const String empty = "empty";
  static const String login = "auth";
  static const String home = "auth";

  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case empty:
        return MaterialPageRoute(builder: (_) => EmptyScreen());

      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      default:
        return MaterialPageRoute(builder: (_) => Scaffold());
    }
  }
}
