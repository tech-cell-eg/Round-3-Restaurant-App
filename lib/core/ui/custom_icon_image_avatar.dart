import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomIconImageAvatar extends StatelessWidget {
  const CustomIconImageAvatar({
    super.key,
    required this.image,
    required this.backColor,
  });
  final String image;
  final Color backColor;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: backColor,
      child: SvgPicture.asset(image),
    );
  }
}