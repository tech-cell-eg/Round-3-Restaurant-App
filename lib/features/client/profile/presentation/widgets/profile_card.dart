import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileCard extends StatelessWidget {
  final Widget child;
  const ProfileCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromRGBO(246, 248, 250, 1),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
        child: child,
      ),
    );
  }
}
