import 'package:flutter/material.dart';

class EmptyOrderList extends StatelessWidget {
  final bool isOngoingTab;

  const EmptyOrderList({super.key, required this.isOngoingTab});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            isOngoingTab ? Icons.receipt_long_outlined : Icons.history_outlined,
            size: 64,
            color: Colors.grey.shade300,
          ),
          const SizedBox(height: 16),
          Text(
            isOngoingTab ? 'No Ongoing Orders' : 'No Order History',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            isOngoingTab
                ? 'You don\'t have any active orders right now'
                : 'Your past orders will appear here',
            style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
          ),
          if (isOngoingTab) ...[
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Navigate to restaurants
              },
              child: const Text('Browse Restaurants'),
            ),
          ],
        ],
      ),
    );
  }
}
