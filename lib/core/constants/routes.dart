// import 'package:food_app/features/chef_home/presention/views/widgets/bottom_sheets.dart';
import 'package:food_app/empty.dart';
import 'package:flutter/material.dart';
import 'package:food_app/features/address/screen/adrees_screen.dart';
import 'package:food_app/features/auth/presentation/screens/forget_password.dart';
import 'package:food_app/features/auth/presentation/screens/login_screen.dart';
import 'package:food_app/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:food_app/features/auth/presentation/screens/verifiy_screen.dart';
import 'package:food_app/features/cheef_menu/presention/views/cheef_view.dart';
import 'package:food_app/features/chef_home/presention/views/chef_home_view.dart';
import 'package:food_app/features/food_burger/presentation/views/food_burger_view.dart';
import 'package:food_app/features/home/presentation/view/home_view.dart';
import 'package:food_app/features/menu/presention/view/menu_view.dart';
import 'package:food_app/features/my_cart/screen/cart_screen.dart';
import 'package:food_app/features/order/presentation/screens/order_screen.dart';
import 'package:food_app/features/profile/presentation/profile_edit_screen.dart';
import 'package:food_app/features/profile/presentation/profile_screen.dart';
import 'package:food_app/features/review/presention/views/review.view.dart';
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
  // static const bottom = "bottom";
  static const menu = "menu";
  static const String chefMenu = "chef_menu";
  static const String review = "review";
  static const String chefHome = "chefHome";
  static const String address = "address";
  static const String myCart = "myCart";
  static const String myOrder = "myOrder";
  static const String profile = "profile";
  static const String editProfile = "edit-profile";

  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case chefMenu:
        return MaterialPageRoute(builder: (_) => ChefMenuView());
      case chefHome:
        return MaterialPageRoute(builder: (_) => ChefHomeView());
      case review:
        return MaterialPageRoute(builder: (_) => ReviewView());
      // case bottom:
      //   return MaterialPageRoute(builder: (_) => SlidingBottomSheetOrders());
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
      case address:
        return MaterialPageRoute(builder: (_) => AddressListScreen());
      case myCart:
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
