import 'package:flutter/material.dart';
import 'package:food_app/core/utils/app_color.dart';

class Buttons {
  static Widget fill({
    required void Function()? onPressed,
    required String label,
  }) => ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColor.kPrimaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 0,
    ),
    child: Text(
      label,
      style: TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
    ),
  );

  static Widget outline({required void Function()? onPressed}) =>
      ElevatedButton(onPressed: onPressed, child: const Text('Login'));

  static Widget icon({required void Function()? onPressed}) =>
      ElevatedButton(onPressed: onPressed, child: const Text('Login'));
}
