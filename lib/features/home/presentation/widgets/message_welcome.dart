import 'package:flutter/material.dart';

class MessageWelcome extends StatelessWidget {
  const MessageWelcome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'Hey Halal, ',
            style: TextStyle(fontWeight: FontWeight.bold), // Bold
          ),
          TextSpan(
            text: 'Good Afternoon! ',
            style: TextStyle(fontWeight: FontWeight.normal), // Normal
          ),
        ],
      ),
    );
  }
}
