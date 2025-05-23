import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/core/utils/app_color.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:food_app/features/client/address/model/address_model.dart';

class AddressCard extends StatelessWidget {
  final Address address;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const AddressCard({
    super.key,
    required this.address,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColor.kWhiteColor,
          radius: 24,
          child: SvgPicture.asset(
            address.label == "HOME"
                ? AppImages.assetsIconsHome
                : AppImages.assetsIconsWork,
          ),
        ),

        title: Text(address.label, style: const TextStyle(fontSize: 15)),
        subtitle: Text(
          address.fullAddress,
          style: const TextStyle(fontSize: 12),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: SvgPicture.asset(AppImages.assetsIconsEdit),
              onPressed: onEdit,
            ),
            IconButton(
              icon: SvgPicture.asset(AppImages.assetsIconsDelete),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
