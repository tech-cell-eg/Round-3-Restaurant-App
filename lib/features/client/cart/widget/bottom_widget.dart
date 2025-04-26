import 'package:flutter/material.dart';
import 'package:food_app/core/ui/buttons.dart';
import 'package:food_app/core/utils/app_color.dart';
import 'package:food_app/features/client/order/presentation/screens/order_screen.dart';

class BottomSection extends StatelessWidget {
  final int total;

  const BottomSection({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Delivery Address',
                style: TextStyle(fontSize: 16, color: AppColor.kItemColor),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'EDIT',
                  style: TextStyle(
                    color: AppColor.kPrimaryColor,
                    decoration: TextDecoration.underline,

                    decorationColor: AppColor.kPrimaryColor,
                    decorationThickness: 1,
                  ),
                ),
              ),
            ],
          ),
          TextField(
            decoration: InputDecoration(
              hintText: '2118 Thornridge Cir. Syracuse',
              hintStyle: const TextStyle(color: AppColor.kItemColor),
              filled: true,
              fillColor: AppColor.kGreyColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'TOTAL:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text('\$$total', style: const TextStyle(fontSize: 20)),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Breakdown >",
                  style: TextStyle(color: AppColor.kPrimaryColor, fontSize: 16),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Buttons.fill(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyOrdersScreen()),
              );
            },
            label: 'place order',
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
