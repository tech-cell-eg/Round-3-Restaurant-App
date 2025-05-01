import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/empty.dart';
import 'package:flutter/material.dart';
import 'package:food_app/features/chat/data/data_source/remote_chat_data_source.dart';
import 'package:food_app/features/client/cart/screen/cart_screen.dart';
import 'package:food_app/features/client/home/cubit/category/category_cubit.dart';
import 'package:food_app/features/client/home/data/data_source/base_home_data_source.dart';
import 'package:food_app/features/client/home/data/repository/home_repository.dart';
import 'package:food_app/features/client/onboarding/onboarding_screen.dart';
import 'package:food_app/features/client/address/screen/address_screen.dart';
import 'package:food_app/features/auth/presentation/screens/login_screen.dart';
import 'package:food_app/features/client/home/presentation/view/home_view.dart';
import 'package:food_app/features/client/menu/presentation/view/menu_view.dart';
import 'package:food_app/features/auth/presentation/screens/verify_screen.dart';
import 'package:food_app/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:food_app/features/auth/presentation/screens/forget_password.dart';
import 'package:food_app/features/client/profile/presentation/profile_screen.dart';
import 'package:food_app/features/client/search/presentation/view/search_view.dart';
import 'package:food_app/features/client/review/presentation/views/review.view.dart';
import 'package:food_app/features/admin/chef_menu/presentation/views/chef_view.dart';
import 'package:food_app/features/client/order/presentation/screens/order_screen.dart';
import 'package:food_app/features/client/profile/presentation/profile_edit_screen.dart';
import 'package:food_app/features/admin/chef_home/presentation/views/chef_home_view.dart';
import 'package:food_app/features/client/food_burger/presentation/views/food_burger_view.dart';

class Routes {


  /* General */
  static const String empty = "empty";
  static const String onboard = "onboard";

  /* Authentication */
  static const String login = "login";
  static const String signup = "signup";
  static const String verifyEmail = "verify-email";
  static const String forgotPassword = "forgot-password";

  /* Client */
  static const String cart = "cart";
  static const String search = "search";
  static const String myOrder = "order";
  static const String address = "address";
  static const String profile = "profile";
  static const String chefMenu = "chef-menu";
  static const String foodBurger = "food-burger";
  static const String editProfile = "edit-profile";

  /* Chef */
  static const String menu = "menu";
  static const String home = "home";
  static const String review = "review";
  static const String chefHome = "chef-home";

  Routes();

  static MaterialPageRoute onGenerateRoute(RouteSettings settings,) {
    switch (settings.name) {
      case chefMenu:
        return MaterialPageRoute(builder: (_) => ChefMenuView());
      case chefHome:
        return MaterialPageRoute(builder: (_) => ChefHomeView());
      case review:
        return MaterialPageRoute(builder: (_) => ReviewView());
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
        return MaterialPageRoute(builder: (_) => VerifyScreen());
      case home:
        return MaterialPageRoute(
          builder:
              (_) => HomeView(),
        );
      case address:
        return MaterialPageRoute(builder: (_) => AddressListScreen());
      case cart:
        return MaterialPageRoute(builder: (_) => CartScreen());
      case myOrder:
        return MaterialPageRoute(builder: (_) => MyOrdersScreen());
      case profile:
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      case editProfile:
        return MaterialPageRoute(builder: (_) => ProfileEditScreen());
      case menu:
        return MaterialPageRoute(builder: (_) => MenuView());
      default:
        return MaterialPageRoute(builder: (_) => Scaffold());
    }
  }
}
