import 'package:flutter/rendering.dart';

abstract class AppTextStyle {
  static const header = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    fontFamily: "Sen",
  );

  static const title = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    fontFamily: "Sen",
  );

  static const subTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: "Sen",
  );

  static const description = TextStyle(fontSize: 14, fontFamily: "Sen");

  static const label = TextStyle(fontSize: 12, fontFamily: "Sen");
}
