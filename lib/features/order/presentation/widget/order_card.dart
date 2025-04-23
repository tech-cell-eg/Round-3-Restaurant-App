import 'package:flutter/material.dart';
import 'package:food_app/core/utils/app_color.dart';
import 'package:food_app/features/order/model/order_model.dart';
import 'package:food_app/features/order/presentation/widget/action_button.dart';
import 'package:intl/intl.dart';

class OrderCard extends StatelessWidget {
  final Order order;
  final Function(String)? onCancel;
  final String image;
  final DateFormat dateFormat = DateFormat('dd MMM, HH:mm');

  OrderCard({
    super.key,
    required this.order,
    this.onCancel,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                order.category,
                style: const TextStyle(
                  color: AppColor.kPrimaryDark,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 8),
              if (order.status == OrderStatus.completed ||
                  order.status == OrderStatus.canceled) ...[
                const SizedBox(width: 8),
                Text(
                  order.status == OrderStatus.completed
                      ? 'Completed'
                      : 'Canceled',
                  style: TextStyle(
                    color:
                        order.status == OrderStatus.completed
                            ? Colors.green
                            : Colors.red,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 12),
          const Divider(
            color: AppColor.kItemColor,
            height: 1,
            thickness: 0.8,
            indent: 8,
            endIndent: 8,
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          order.restaurant,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColor.kPrimaryDark,
                          ),
                        ),
                        Text(
                          '#${order.id}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColor.kPrimaryDark,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          '\$${order.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColor.kPrimaryDark,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          ' | ${order.items} ${order.items > 1 ? 'Items' : 'Item'}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        if (order.status != OrderStatus.ongoing) ...[
                          const Spacer(),
                          Text(
                            dateFormat.format(order.date),
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          OrderActions(order: order, onCancel: onCancel),
        ],
      ),
    );
  }
}
