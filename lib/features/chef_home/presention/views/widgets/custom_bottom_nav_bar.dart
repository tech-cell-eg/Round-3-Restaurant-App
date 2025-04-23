import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/core/utils/app_color.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:food_app/features/chef_home/presention/views/widgets/chef_home_view_body.dart';
import 'package:food_app/features/food_burger/presentation/views/food_burger_view.dart';
import 'package:food_app/features/home/presentation/view/home_view.dart';
import 'package:food_app/features/menu/presention/view/menu_view.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      tabs: [
        PersistentTabConfig(
          screen: ChefHomeViewBody(),
          item: ItemConfig(
            activeForegroundColor: AppColor.kPrimaryColor,
            inactiveForegroundColor: AppColor.kItemColor,

            icon: Icon(Icons.grid_view),
          ),
        ),
        PersistentTabConfig(
          screen: MenuView(),
          item: ItemConfig(
            activeForegroundColor: AppColor.kPrimaryColor,
            inactiveForegroundColor: AppColor.kItemColor,

            icon: Icon(Icons.menu),
          ),
        ),
        PersistentTabConfig(
          screen: HomeView(),
          item: ItemConfig(
            icon: SvgPicture.asset(AppImages.assetsIconsAddProduct),
          ),
        ),
        PersistentTabConfig(
          screen: FoodBurgerView(),
          item: ItemConfig(
            activeForegroundColor: AppColor.kPrimaryColor,
            inactiveForegroundColor: AppColor.kItemColor,

            icon: Icon(Icons.notifications),
          ),
        ),
        PersistentTabConfig(
          screen: FoodBurgerView(),
          item: ItemConfig(
            inactiveForegroundColor: AppColor.kItemColor,

            activeForegroundColor: AppColor.kPrimaryColor,
            icon: Icon(Icons.person),
          ),
        ),
      ],
      navBarBuilder:
          (navBarConfig) => Style13BottomNavBar(navBarConfig: navBarConfig),
    );
  }
}
