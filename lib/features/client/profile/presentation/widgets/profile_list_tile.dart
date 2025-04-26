import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileListTile extends StatelessWidget {
  final Widget icon;
  final String title;
  final VoidCallback onPressed;
  const ProfileListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 18.r,
        backgroundColor: Colors.white,
        child: icon,
      ),
      title: Text(title),
      onTap: onPressed,
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}
