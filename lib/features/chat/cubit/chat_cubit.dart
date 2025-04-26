import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/features/chat/cubit/chat_state.dart';
import 'package:food_app/features/chat/data/model/message.dart';
import 'package:food_app/features/chat/data/repositories/chat_repository.dart';
import 'package:food_app/features/chat/data/data_source/remote_chat_data_source.dart';

class ChatCubit extends Cubit<ChatState> {
  final String _chatId;
  late final ChatRepository _chatRepository;
  late final StreamSubscription<List<Message>> _chatSubscription;
  ChatCubit(this._chatId) : super(ChatEmpty()) {
    _chatRepository = ChatRepository(RemoteChatDataSource());
    listenOnChatMessages();
  }

  void listenOnChatMessages() {
    emit(ChatLoading());
    try {
      _chatSubscription = _chatRepository
          .listenOnChatMessages(_chatId)
          .listen((messages) => emit(ChatLoaded(messages)));
      emit(ChatEmpty());
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }

  Future<void> sendMessage(Map<String, dynamic> payload) async {
    try {
      await _chatRepository.sendMessage(_chatId, payload);
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }

  @override
  Future<void> close() {
    _chatSubscription.cancel();
    return super.close();
  }
}
