import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/core/utils/app_color.dart';
import 'package:food_app/features/my_cart/model/cart_model.dart';
import 'package:food_app/features/my_cart/widget/bottom_widget.dart';
import 'package:food_app/features/my_cart/widget/cart_item_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool isEditing = false;
  final List<CartItem> cartItems = [
    CartItem(
      image: 'assets/images/pizza.jpg',
      name: 'Pizza Calzone European',
      price: 64,
      size: '14"',
      quantity: 2,
    ),
    CartItem(
      image: 'assets/images/pizza.jpg',
      name: 'Pizza Calzone European',
      price: 32,
      size: '14"',
      quantity: 1,
    ),
    CartItem(
      image: 'assets/images/pizza.jpg',
      name: 'Pizza Calzone European',
      price: 32,
      size: '14"',
      quantity: 1,
    ),
    CartItem(
      image: 'assets/images/pizza.jpg',
      name: 'Pizza Calzone European',
      price: 32,
      size: '14"',
      quantity: 1,
    ),
    CartItem(
      image: 'assets/images/pizza.jpg',
      name: 'Pizza Calzone European',
      price: 32,
      size: '14"',
      quantity: 1,
    ),
    CartItem(
      image: 'assets/images/pizza.jpg',
      name: 'Pizza Calzone European',
      price: 32,
      size: '14"',
      quantity: 1,
    ),
    CartItem(
      image: 'assets/images/pizza.jpg',
      name: 'Pizza Calzone European',
      price: 32,
      size: '14"',
      quantity: 1,
    ),

    CartItem(
      image: 'assets/images/pizza.jpg',
      name: 'Pizza Calzone European',
      price: 32,
      size: '14"',
      quantity: 1,
    ),
    CartItem(
      image: 'assets/images/pizza.jpg',
      name: 'Pizza Calzone European',
      price: 32,
      size: '14"',
      quantity: 1,
    ),

    CartItem(
      image: 'assets/images/pizza.jpg',
      name: 'Pizza Calzone European',
      price: 32,
      size: '14"',
      quantity: 1,
    ),
  ];

  void toggleEditMode() {
    setState(() {
      isEditing = !isEditing;
    });
  }

  void removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  void updateQuantity(int index, int change) {
    setState(() {
      cartItems[index].quantity += change;
      if (cartItems[index].quantity < 1) cartItems[index].quantity = 1;
    });
  }

  int get total =>
      cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kPrimaryDark,
      appBar: AppBar(
        backgroundColor: AppColor.kPrimaryDark,
        title: const Text(
          'Cart',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        leadingWidth: 60, 
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: CircleAvatar(
              radius: 14,
              backgroundColor: AppColor.kItemColor,
              child: SvgPicture.asset(
                "assets/icons/back.svg",
                width: 14,
                height: 14,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: toggleEditMode,
            child: Text(
              isEditing ? 'DONE' : 'EDIT ITEMS',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: isEditing ? Colors.green : Colors.orange,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    return CartItemWidget(
                      image: cartItems[index].image,
                      item: cartItems[index],
                      isEditing: isEditing,
                      onRemove: () => removeItem(index),
                      onQuantityChanged:
                          (change) => updateQuantity(index, change),
                    );
                  },
                ),
              ),
            ),
            BottomSection(total: total),
          ],
        ),
      ),
    );
  }
}
