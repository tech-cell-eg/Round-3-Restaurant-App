import 'package:flutter/material.dart';
import 'package:food_app/features/admin/chef_home/presentation/views/widgets/custom_time_char_text.dart';

class CustomSectionTimeChar extends StatelessWidget {
  const CustomSectionTimeChar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomTimeCharText(time: '10am'),
        CustomTimeCharText(time: '11am'),
        CustomTimeCharText(time: '12pm'),
        CustomTimeCharText(time: '01pm'),
        CustomTimeCharText(time: '02pm'),
        CustomTimeCharText(time: '03pm'),
        CustomTimeCharText(time: '04pm'),
      ],
    );
  }
}
