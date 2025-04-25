import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/features/chat/cubit/chat_cubit.dart';

class ChatBottomView extends StatefulWidget {
  final String restaurantId;
  const ChatBottomView(this.restaurantId, {super.key});

  @override
  State<ChatBottomView> createState() => _ChatBottomViewState();
}

class _ChatBottomViewState extends State<ChatBottomView> {
  late final TextEditingController controller;
  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12.r),
      ),
      margin: EdgeInsets.symmetric(vertical: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: TextField(
              minLines: 1,
              maxLines: 3,
              controller: controller,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                hintText: 'Type your message...',
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              context.read<ChatCubit>().sendMessage({
                'content': controller.text,
                'sendBy': "widget.restaurantId",
                'id': DateTime.now().millisecondsSinceEpoch.toString(),
                'time': DateTime.now().millisecondsSinceEpoch.toString(),
              });
              controller.clear();
            },
          ),
        ],
      ),
    );
  }
}
