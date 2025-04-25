import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/helper/functions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/features/chat/cubit/chat_cubit.dart';
import 'package:food_app/features/chat/cubit/chat_state.dart';
import 'package:food_app/features/chat/presentation/views/chat_bottom.dart';
import 'package:food_app/features/chat/presentation/widgets/message_card.dart';

class ChatScreen extends StatelessWidget {
  final String restaurantId;
  final String restaurantName;
  const ChatScreen(
    this.restaurantId, {
    super.key,
    required this.restaurantName,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              ChatCubit(Functions.getChatID("123456789", restaurantId)),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(title: Text(restaurantName)),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                children: [
                  Expanded(
                    child: BlocBuilder<ChatCubit, ChatState>(
                      buildWhen: (prev, curr) {
                        if (prev is ChatLoaded && curr is ChatLoaded) {
                          return prev.messages.length != curr.messages.length;
                        }
                        return true;
                      },
                      builder: (context, state) {
                        if (state is ChatLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is ChatLoaded) {
                          final messages = state.messages;
                          return messages.isEmpty
                              ? const Center(
                                child: Text('No chat messages available.'),
                              )
                              : ListView.builder(
                                reverse: true,
                                itemCount: messages.length,
                                itemBuilder: (context, idx) {
                                  final index = messages.length - 1 - idx;
                                  final message = messages[index];

                                  return MessageCard(
                                    message,
                                    key: ValueKey(message.id),
                                    index: index,
                                    isRestaurant:
                                        restaurantId == message.sendBy,
                                    isSameSender:
                                        index > 0 &&
                                        messages[index - 1].sendBy ==
                                            message.sendBy,
                                    isSender: message.sendBy == restaurantId,
                                  );
                                },
                              );
                        } else if (state is ChatError) {
                          return Center(child: Text(state.error));
                        }
                        return const Center(
                          child: Text('No chat messages available.'),
                        );
                      },
                    ),
                  ),
                  ChatBottomView(restaurantId),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
