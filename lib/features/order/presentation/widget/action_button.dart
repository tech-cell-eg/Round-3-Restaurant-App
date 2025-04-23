import 'package:flutter/material.dart';
import 'package:food_app/core/ui/buttons.dart';
import 'package:food_app/features/order/model/order_model.dart';

class OrderActions extends StatelessWidget {
  final Order order;
  final Function(String)? onCancel;

  const OrderActions({super.key, required this.order, this.onCancel});

  @override
  Widget build(BuildContext context) {
    switch (order.status) {
      case OrderStatus.ongoing:
        return Row(
          children: [
            Expanded(
              child: Buttons.fill(
                onPressed: () {},
                label: "Track Order",
                height: 50,
                width: 40,
                fontSize: 14,
              ),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: Buttons.outline(
                onPressed: () => onCancel?.call(order.id),
                label: "Cancel ",
                height: 50,
                width: 40,
                fontSize: 14,
              ),
            ),
          ],
        );

      case OrderStatus.completed:
      case OrderStatus.canceled:
        return Row(
          children: [
            Expanded(
              child: Buttons.outline(
                onPressed: () {},
                label: "Rate",
                height: 50,
                width: 40,
                fontSize: 14,
              ),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: Buttons.fill(
                onPressed: () {},
                label: "Re Order",
                height: 50,
                width: 40,
                fontSize: 14,
              ),
            ),
          ],
        );
    }
  }
}
