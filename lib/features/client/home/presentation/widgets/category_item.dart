import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/constants/routes.dart';
import 'package:food_app/core/ui/cached_network_image.dart';
import 'package:food_app/core/utils/app_color.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:food_app/core/utils/app_text_style.dart';
import 'package:food_app/features/client/home/data/model/categpry_model.dart';

// ignore: must_be_immutable
class CategoryItem extends StatefulWidget {
  const CategoryItem({super.key, required this.category, required this.index});
  final CategoryModel category;
  final int index;

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  int isSelected = -1;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = widget.index;
        });

        Navigator.pushNamed(context, Routes.foodBurger);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        width: 134.w,
        height: 60.h,
        decoration: BoxDecoration(
          color:
              isSelected != widget.index
                  ? Colors.transparent
                  : AppColor.kSecondaryColor,
          border: Border.all(
            width: 0.4,
            color:
                isSelected != widget.index
                    ? AppColor.kItemColor
                    : AppColor.kSecondaryColor,
          ),
          borderRadius: BorderRadius.circular(32.r),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: CustomCachedNetWorkImage(
                height: 44.h,
                width: 44.w,

                image: widget.category.imageUrl, 
                imageError: AppImages.assetsImagesFoodTopViewDeliciousFoodAssortment,
              ),
            ),

            Expanded(
              child: Text(
                widget.category.name,
                style: AppTextStyle.label.copyWith(
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
