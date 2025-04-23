import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/core/utils/app_color.dart';
import 'package:food_app/features/order/model/order_model.dart';
import 'package:food_app/features/order/presentation/widget/order_list.dart';
import 'package:intl/intl.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final DateFormat dateFormat = DateFormat('dd MMM, HH:mm');

  List<Order> ongoingOrders = [
    Order(
      image: "assets/images/pizza.jpg",
      id: '162432',
      restaurant: 'Pizza Hut',
      price: 35.25,
      items: 3,
      category: 'Food',
      status: OrderStatus.ongoing,
      date: DateTime(2023, 1, 29, 12, 30),
    ),
    Order(
      image: "assets/images/pizza.jpg",
      id: '242432',
      restaurant: 'McDonald',
      price: 40.15,
      items: 2,
      category: 'Drink',
      status: OrderStatus.ongoing,
      date: DateTime(2023, 1, 30, 12, 30),
    ),
  ];

  List<Order> historyOrders = [
    Order(
      image: "assets/images/pizza.jpg",
      id: '240112',
      restaurant: 'Starbucks',
      price: 10.20,
      items: 1,
      category: 'Drink',
      status: OrderStatus.canceled,
      date: DateTime(2023, 1, 30, 12, 30),
    ),

    Order(
      image: "assets/images/pizza.jpg",
      id: '240112',
      restaurant: 'Starbucks',
      price: 10.20,
      items: 1,
      category: 'Drink',
      status: OrderStatus.completed,
      date: DateTime(2023, 1, 30, 12, 30),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _cancelOrder(String orderId) {
    setState(() {
      final canceledOrder = ongoingOrders.firstWhere(
        (order) => order.id == orderId,
      );
      ongoingOrders.removeWhere((order) => order.id == orderId);
      historyOrders.insert(
        0,
        Order(
          image: canceledOrder.image,
          id: canceledOrder.id,
          restaurant: canceledOrder.restaurant,
          price: canceledOrder.price,
          items: canceledOrder.items,
          category: canceledOrder.category,
          status: OrderStatus.canceled,
          date: DateTime.now(),
        ),
      );
    });

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Order #$orderId canceled')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 60,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: CircleAvatar(
              radius: 40,
              backgroundColor: const Color.fromARGB(255, 219, 225, 231),
              child: SvgPicture.asset(
                "assets/icons/back.svg",
                width: 20,
                height: 20,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: const Color.fromARGB(255, 219, 225, 231),
              child: SvgPicture.asset(
                "assets/icons/more_vector.svg",
                width: 5,
                height: 5,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(width: 16),
        ],
        title: const Text('My Orders'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [Tab(text: 'Ongoing'), Tab(text: 'History')],
          indicatorColor: AppColor.kPrimaryColor,
          labelColor: AppColor.kPrimaryColor,
          unselectedLabelColor: Colors.grey,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          OrderList(
            orders: ongoingOrders,
            isOngoingTab: true,
            onCancel: _cancelOrder,
          ),
          OrderList(orders: historyOrders, isOngoingTab: false),
        ],
      ),
    );
  }
}
