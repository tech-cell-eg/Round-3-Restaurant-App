import 'package:food_app/features/chat/data/model/message.dart';

sealed class ChatState {}


class ChatLoading extends ChatState {}

class ChatEmpty extends ChatState {}

class ChatLoaded extends ChatState {
  final List<Message> messages;
  ChatLoaded(this.messages);
}

class ChatError extends ChatState {
  final String error;
  ChatError(this.error);
}
