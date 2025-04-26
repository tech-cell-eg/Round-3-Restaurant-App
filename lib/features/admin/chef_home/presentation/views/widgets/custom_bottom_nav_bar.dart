// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:food_app/core/utils/app_color.dart';
// import 'package:food_app/core/utils/app_images.dart';
// import 'package:food_app/features/admin/chef_menu/presentation/views/chef_view.dart';
// import 'package:food_app/features/admin/chef/food/presentation/add_new_item_screen.dart';
// import 'package:food_app/features/admin/chef/my_food/screen/my_food_screen.dart';
// import 'package:food_app/features/admin/chef/notification/notification_screen.dart';
// import 'package:food_app/features/admin/chef_home/presentation/views/widgets/chef_home_view_body.dart';
// import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

// class CustomBottomNavBar extends StatelessWidget {
//   CustomBottomNavBar({super.key});

//   final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

//   @override
//   Widget build(BuildContext context) {
//     return PersistentTabView(
//       context,
//       controller: _controller,
//       screens: _buildScreens(),
//       items: _navBarsItems(),
//       confineInSafeArea: true,
//       backgroundColor: Colors.white,
//       handleAndroidBackButtonPress: true,
//       resizeToAvoidBottomInset: true,
//       stateManagement: true, // Keep this true to maintain state
//       hideNavigationBar: false,
//       popAllScreensOnTapOfSelectedTab: true, // Important for non-stack behavior
//       popActionScreens: PopActionScreensType.once, // Or PopActionScreensType.none
//       navBarStyle: NavBarStyle.style13, // Your chosen style
//       screenTransitionAnimation: const ScreenTransitionAnimation(
//         animateTabTransition: true,
//         curve: Curves.easeInOut,
//         duration: Duration(milliseconds: 300),
//       ),
//     );
//   }

//   List<Widget> _buildScreens() {
//     return [
//       const ChefHomeViewBody(),
//       const MyFoodScreen(),
//       const AddNewItemScreen(),
//       NotificationScreen(
//         notifications: demoNotifications,
//         messages: demoMessages,
//       ),
//       const ChefMenuView(),
//     ];
//   }

//   List<PersistentBottomNavBarItem> _navBarsItems() {
//     return [
//       PersistentBottomNavBarItem(
//         icon: const Icon(Icons.grid_view),
//         inactiveIcon: Icon(Icons.grid_view, color: AppColor.kItemColor),
//         activeColorPrimary: AppColor.kPrimaryColor,
//         inactiveColorPrimary: AppColor.kItemColor,
//       ),
//       PersistentBottomNavBarItem(
//         icon: const Icon(Icons.menu),
//         inactiveIcon: Icon(Icons.menu, color: AppColor.kItemColor),
//         activeColorPrimary: AppColor.kPrimaryColor,
//         inactiveColorPrimary: AppColor.kItemColor,
//       ),
//       PersistentBottomNavBarItem(
//         icon: SvgPicture.asset(AppImages.assetsIconsAddProduct),
//         inactiveIcon: SvgPicture.asset(AppImages.assetsIconsAddProduct, color: AppColor.kItemColor),
//         activeColorPrimary: AppColor.kPrimaryColor,
//         inactiveColorPrimary: AppColor.kItemColor,
//       ),
//       PersistentBottomNavBarItem(
//         icon: const Icon(Icons.notifications),
//         inactiveIcon: Icon(Icons.notifications, color: AppColor.kItemColor),
//         activeColorPrimary: AppColor.kPrimaryColor,
//         inactiveColorPrimary: AppColor.kItemColor,
//       ),
//       PersistentBottomNavBarItem(
//         icon: const Icon(Icons.person),
//         inactiveIcon: Icon(Icons.person, color: AppColor.kItemColor),
//         activeColorPrimary: AppColor.kPrimaryColor,
//         inactiveColorPrimary: AppColor.kItemColor,
//       ),
//     ];
//   }
// }