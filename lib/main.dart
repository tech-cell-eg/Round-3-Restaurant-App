import 'package:flutter/material.dart';
import 'package:food_app/core/constants/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Delivery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      onGenerateRoute: Routes.onGenerateRoute,
      initialRoute: Routes.empty,//change this line to required screen name
    );
  }
}
