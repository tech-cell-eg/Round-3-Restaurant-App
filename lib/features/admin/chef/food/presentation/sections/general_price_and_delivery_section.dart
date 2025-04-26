import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/features/admin/chef/food/controllers/check_box_controller.dart';

class GeneralPriceAndDeliverySection extends StatelessWidget {
  final TextEditingController price;
  final CheckboxController isPickup, isDelivery;
  const GeneralPriceAndDeliverySection({
    super.key,
    required this.price,
    required this.isPickup,
    required this.isDelivery,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text("PRICE"),
        Row(
          spacing: 10.w,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28.r),
                  border: Border.all(color: Colors.grey),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 14.w,
                    vertical: 4.h,
                  ),
                  child: Row(
                    children: [
                      Text("\$"),
                      SizedBox(width: 4.w),
                      Expanded(
                        child: TextFormField(
                          controller: price,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            isCollapsed: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  StatefulBuilder(
                    builder: (context, setState) {
                      return Row(
                        children: [
                          Checkbox(
                            value: isPickup.value,
                            onChanged:
                                (value) => setState(
                                  () => isPickup.value = value ?? false,
                                ),
                          ),
                          const Text("Pickup"),
                        ],
                      );
                    },
                  ),
                  StatefulBuilder(
                    builder: (context, setState) {
                      return Row(
                        children: [
                          Checkbox(
                            value: isDelivery.value,
                            onChanged:
                                (value) => setState(
                                  () => isDelivery.value = value ?? false,
                                ),
                          ),
                          const Text("Delivery"),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
