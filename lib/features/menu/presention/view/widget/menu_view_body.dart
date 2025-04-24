import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/features/menu/presention/view/widget/Custom_app_bar_menu.dart';
import 'package:food_app/core/ui/custom_logout.dart';
import 'package:food_app/features/menu/presention/view/widget/custom_user_data.dart';
import 'package:food_app/features/menu/presention/view/widget/first_card_of_menu.dart';
import 'package:food_app/features/menu/presention/view/widget/second_card_menu.dart';
import 'package:food_app/features/menu/presention/view/widget/third_card_of_menu.dart';

class MenuViewBody extends StatelessWidget {
  const MenuViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0.sp, vertical: 10.h),
        child: Column(
          children: [
            SizedBox(height: 24.h),

            CustomAppBarMenu(),
            SizedBox(height: 24.h),
            CustomUserData(),
            SizedBox(height: 32.h),
            FirstCardOfMenu(),
            SizedBox(height: 24.h),
            SecondCardOfMenu(),
            SizedBox(height: 24.h),
            ThirdCardOfMenu(),
            SizedBox(height: 24.h),
            CustomLogout(),
          ],
        ),
      ),
    );
  }
}
