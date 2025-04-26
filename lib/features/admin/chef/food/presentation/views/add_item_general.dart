import 'package:flutter/material.dart';
import 'package:food_app/core/ui/inputs.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/features/admin/chef/food/controllers/image_controller.dart';
import 'package:food_app/features/admin/chef/food/controllers/check_box_controller.dart';
import 'package:food_app/features/admin/chef/food/presentation/sections/general_images_section.dart';
import 'package:food_app/features/admin/chef/food/presentation/sections/general_price_and_delivery_section.dart';

class AddItemGeneralDataView extends StatelessWidget {
  final TextEditingController name, price, description;
  final CheckboxController isPickup, isDelivery;
  final ImageController images;
  const AddItemGeneralDataView({
    super.key,
    required this.name,
    required this.price,
    required this.images,
    required this.isPickup,
    required this.isDelivery,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      child: Column(
        spacing: 12.h,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextInputField(
            controller: name,
            label: "ITEM NAME",
            hint: "Enter item name",
          ),
          GeneralImagesSection(controller: images),
          GeneralPriceAndDeliverySection(
            isPickup: isPickup,
            isDelivery: isDelivery,
            price: price,
          ),
          TextInputField(
            controller: description,
            label: "DETAILS",
            hint: "Enter item description",
            lines: 4,
          ),
        ],
      ),
    );
  }
}
