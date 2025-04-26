import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/core/utils/app_color.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:food_app/core/utils/app_text_style.dart';

class TextFormSearch extends StatelessWidget {
  const TextFormSearch({super.key, this.onTap});

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Search ',
        labelStyle: AppTextStyle.description.copyWith(
          color: AppColor.kItemColor,
        ),
        prefixIcon: SvgPicture.asset(
          AppImages.assetsIconsSearch,
          colorFilter: ColorFilter.linearToSrgbGamma(),
          width: 20,
          height: 20,
        ),
        // Icon(FontAwesomeIcons.magnifyingGlass, color: AppColor.kItemColor),
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
