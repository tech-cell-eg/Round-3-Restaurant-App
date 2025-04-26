import 'package:flutter/material.dart';
import 'package:food_app/core/utils/app_text_style.dart';
import 'package:food_app/features/admin/chef_home/presentation/views/widgets/custom_text_primary_color.dart';

class CustomTitleCardPopular extends StatelessWidget {
  const CustomTitleCardPopular({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Popular Items This Weeks", style: AppTextStyle.description),

        CustomTextPrimaryColor(title: "See All"),
      ],
    );
  }
}
