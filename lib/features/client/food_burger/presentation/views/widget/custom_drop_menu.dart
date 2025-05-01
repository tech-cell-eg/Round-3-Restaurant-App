import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/utils/app_color.dart';
import 'package:food_app/core/utils/app_text_style.dart';

class CustomDropMenu extends StatefulWidget {
  const CustomDropMenu({super.key});

  @override
  _CustomDropMenuState createState() => _CustomDropMenuState();
}

class _CustomDropMenuState extends State<CustomDropMenu> {
  String? selectedValue;
  final List<String> items = ['Burger', 'Hot Dog'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 102.w,
      height: 45.h,
      child: DropdownButtonFormField<String>(
        alignment: Alignment.bottomCenter,

        value: selectedValue,
        hint: Text("All", style: AppTextStyle.label),

        icon: Icon(Icons.arrow_drop_down, color: AppColor.kPrimaryColor),
        isExpanded: true,
        decoration: InputDecoration(
          labelStyle: TextStyle(color: AppColor.kBlackColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(width: 0.8, color: AppColor.kItemColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(color: AppColor.kItemColor, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(color: AppColor.kItemColor, width: 1.0),
          ),
          filled: true,
          fillColor: AppColor.kItemColor.withOpacity(0.05),
        ),
        items:
            items.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item, style: AppTextStyle.label),
              );
            }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            selectedValue = newValue;
          });
        },
        dropdownColor: Colors.white, // لون خلفية القائمة المنسدلة
        style: TextStyle(color: Colors.black87), // لون النص المختار
      ),
    );
  }
}
