import 'package:flutter/material.dart';
import 'package:food_app/features/client/review/presentation/views/widget/review_view_body.dart';

class ReviewView extends StatelessWidget {
  const ReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ReviewViewBody(),
    );
  }
}