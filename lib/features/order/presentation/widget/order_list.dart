import 'package:flutter/material.dart';
import 'package:food_app/features/order/model/order_model.dart';
import 'package:food_app/features/order/presentation/widget/empty_order_list.dart';
import 'package:food_app/features/order/presentation/widget/order_card.dart';

class OrderList extends StatelessWidget {
  final List<Order> orders;
  final bool isOngoingTab;
  final Function(String)? onCancel;

  const OrderList({
    super.key,
    required this.orders,
    required this.isOngoingTab,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    if (orders.isEmpty) {
      return EmptyOrderList(isOngoingTab: isOngoingTab);
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: orders.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder:
          (context, index) => OrderCard(
            image: orders[index].image,
            order: orders[index],
            onCancel: onCancel,
          ),
    );
  }
}
