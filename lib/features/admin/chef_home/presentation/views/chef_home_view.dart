import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/utils/app_color.dart';
import 'package:food_app/features/admin/chef/food/presentation/add_new_item_screen.dart';
import 'package:food_app/features/admin/chef/my_food/screen/my_food_screen.dart';
import 'package:food_app/features/admin/chef/notification/notification_screen.dart';
import 'package:food_app/features/admin/chef_home/presentation/views/widgets/chef_home_view_body.dart';
import 'package:food_app/features/admin/chef_menu/presentation/views/chef_view.dart';

final List<Widget> _pages = [
  const ChefHomeViewBody(),
  const MyFoodScreen(),
  const AddNewItemScreen(),
  NotificationScreen(notifications: demoNotifications, messages: demoMessages),
  const ChefMenuView(),
];

class ChefHomeView extends StatefulWidget {
  const ChefHomeView({super.key});

  @override
  State<ChefHomeView> createState() => _ChefHomeViewState();
}

class _ChefHomeViewState extends State<ChefHomeView> {
  int index = 0;

  void onChangeRoute(value) {
    if (value == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AddNewItemScreen()),
      );
    } else {
      setState(() => index = value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _pages[index]),
      bottomNavigationBar: SizedBox(
        height: 55.h,
        child: BottomNavigationBar(
          elevation: 4,
          iconSize: 24.sp,
          currentIndex: index,
          onTap: onChangeRoute,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: AppColor.kItemColor,
          selectedItemColor: AppColor.kPrimaryColor,
          selectedLabelStyle: TextStyle(fontSize: 0.sp),
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.grid_view),
              label: '',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.fastfood),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: CircleAvatar(
                radius: 25.r,
                backgroundColor: AppColor.kPrimaryColor,
                child: CircleAvatar(
                  radius: 24.r,
                  backgroundColor: Color.fromRGBO(255, 241, 242, 1),
                  child: Icon(
                    Icons.add,
                    size: 22.sp,
                    color: AppColor.kPrimaryColor,
                  ),
                ),
              ),
              label: '',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: '',
            ),
            const BottomNavigationBarItem(icon: Icon(Icons.menu), label: ''),
          ],
        ),
      ),
    );
  }
}
