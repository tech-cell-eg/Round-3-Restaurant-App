import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/core/utils/app_color.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:food_app/features/client/cart/model/cart_model.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem item;
  final String image;
  final bool isEditing;
  final VoidCallback onRemove;
  final Function(int) onQuantityChanged;

  const CartItemWidget({
    super.key,
    required this.item,
    required this.isEditing,
    required this.onRemove,
    required this.onQuantityChanged,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Row(
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '\$${item.price}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item.size,
                          style: const TextStyle(color: Colors.white60),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () => onQuantityChanged(-1),
                          icon: const Icon(
                            Icons.remove_circle,
                            color: AppColor.kItemColor,
                          ),
                        ),
                        Text(
                          '${item.quantity}',
                          style: const TextStyle(color: AppColor.kWhiteColor),
                        ),
                        IconButton(
                          onPressed: () => onQuantityChanged(1),
                          icon: const Icon(
                            Icons.add_circle,
                            color: AppColor.kItemColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
        if (isEditing)
          Positioned(
            right: 20,
            top: 0,
            child: IconButton(
              icon: SvgPicture.asset(AppImages.assetsIconsCancel),
              onPressed: onRemove,
            ),
          ),
      ],
    );
  }
}
