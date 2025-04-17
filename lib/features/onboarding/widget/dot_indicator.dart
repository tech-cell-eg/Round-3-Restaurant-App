import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  final bool isSelected;

  const DotIndicator({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: isSelected ? 12 : 8,
      height: isSelected ? 12 : 8,
      decoration: BoxDecoration(
        color: isSelected ? Colors.orange : Colors.grey.shade300,
        shape: BoxShape.circle,
      ),
    );
  }
}
