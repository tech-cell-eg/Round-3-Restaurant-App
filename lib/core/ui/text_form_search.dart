import 'package:flutter/material.dart';
import 'package:food_app/core/utils/app_color.dart';
import 'package:food_app/core/utils/app_text_style.dart';

class TextFormSearch extends StatelessWidget {
  const TextFormSearch({super.key, this.onTap, this.onChanged});

  final Function()? onTap;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged:onChanged ,
      decoration: InputDecoration(
        labelText: 'Search ',
        labelStyle: AppTextStyle.description.copyWith(
          color: AppColor.kItemColor,
        ),
        prefixIcon: Icon(Icons.search_sharp, color: AppColor.kItemColor),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.kItemColor, width: 1.0),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.kItemColor, width: 1.0),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      onTap: onTap,
    );
  }
}
