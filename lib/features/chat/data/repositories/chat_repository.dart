import 'package:food_app/features/chat/data/data_source/base_chat_data_source.dart';
import 'package:food_app/features/chat/data/model/message.dart';

class ChatRepository {
  final BaseChatDataSource _dataSource;
  ChatRepository(this._dataSource);

  Future<bool> sendMessage(String chatId, Map<String, dynamic> payload) async {
    try {
      return await _dataSource.sendMessage(chatId, payload);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Message>> getChatMessages(String chatId) async {
    try {
      return await _dataSource
          .getChatMessages(chatId)
          .then((list) => list.map((e) => Message.fromJson(e)).toList());
    } catch (e) {
      rethrow;
    }
  }

  Stream<List<Message>> listenOnChatMessages(String chatId) {
    try {
      return _dataSource
          .listenOnChatMessages(chatId)
          .map((list) => list.map((e) => Message.fromJson(e)).toList());
    } catch (e) {
      rethrow;
    }
  }
}
