import 'package:flutter/material.dart';
import 'package:food_app/core/extensions/string.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/features/chat/data/model/message.dart';

class MessageCard extends StatelessWidget {
  final int index;
  final Message message;
  final bool isSender, isSameSender, isRestaurant;
  const MessageCard(
    this.message, {
    super.key,
    required this.index,
    this.isSender = false,
    this.isSameSender = false,
    this.isRestaurant = false,
  });

  @override
  Widget build(BuildContext context) {
    return !isSender
        ? _SenderMessageCard(
          message,
          isSameSender: isSameSender,
          isRestaurant: isRestaurant,
        )
        : _ReceiverMessageCard(
          message,
          isSameSender: isSameSender,
          isRestaurant: isRestaurant,
        );
  }
}

class _SenderMessageCard extends StatelessWidget {
  final Message message;
  final bool isSameSender, isRestaurant;
  const _SenderMessageCard(
    this.message, {
    required this.isSameSender,
    required this.isRestaurant,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: isSameSender ? 12.h : 8.h),
      child: Row(
        spacing: 5.w,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 118, 34, 1),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: .4),
                  blurRadius: 3,
                  offset: const Offset(1, 2),
                ),
              ],
            ),
            child: IntrinsicWidth(
              child: Column(
                spacing: 5.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message.content,
                    style: TextStyle(
                      color: const Color.fromARGB(221, 32, 31, 31),
                      fontSize: 15,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      spacing: 5.w,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          message.time.decodeDate(),
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          isSameSender
              ? CircleAvatar(radius: 25, backgroundColor: Colors.transparent)
              : _buildMessageCircleAvatar(
                color: const Color.fromRGBO(255, 198, 174, 1),
                isRestaurant: isRestaurant,
              ),
        ],
      ),
    );
  }
}

class _ReceiverMessageCard extends StatelessWidget {
  final Message message;
  final bool isSameSender, isRestaurant;
  const _ReceiverMessageCard(
    this.message, {
    required this.isSameSender,
    required this.isRestaurant,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: isSameSender ? 12.h : 8.h),
      child: Row(
        spacing: 5.w,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isSameSender
              ? CircleAvatar(radius: 25, backgroundColor: Colors.transparent)
              : _buildMessageCircleAvatar(
                color: const Color.fromRGBO(152, 168, 184, 1),
                isRestaurant: isRestaurant,
              ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(240, 245, 250, 1),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: .4),
                  blurRadius: 3,
                  offset: const Offset(1, 2),
                ),
              ],
            ),
            child: Column(
              spacing: 5.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message.content,
                  style: TextStyle(
                    color: const Color.fromARGB(221, 32, 31, 31),
                    fontSize: 15,
                  ),
                ),
                Text(
                  message.time.decodeDate(),
                  style: TextStyle(color: Colors.blueGrey, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildMessageCircleAvatar({
  required Color color,
  required bool isRestaurant,
}) {
  return CircleAvatar(
    radius: 25,
    backgroundColor: color,
    child:
        isRestaurant
            ? Icon(Icons.restaurant, color: Colors.white, size: 25.sp)
            : Icon(Icons.person, color: Colors.white, size: 30.sp),
  );
}
