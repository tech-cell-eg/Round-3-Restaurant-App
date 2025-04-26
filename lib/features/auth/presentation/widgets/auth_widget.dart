import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/features/auth/presentation/widgets/auth_header.dart';

class AuthScreen extends StatelessWidget {
  final Widget form;
  final String title;
  final String subtitle;
  final bool showBackArrow;

  const AuthScreen({
    super.key,
    required this.form,
    required this.title,
    required this.subtitle,
    this.showBackArrow = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(28, 28, 46, 1),
      body: Column(
        spacing: 25.h,
        children: [
          AuthHeaderView(title: title, subtitle: subtitle),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: form,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
