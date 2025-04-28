abstract class BaseChatDataSource {
  Future<bool> sendMessage(String chatId, Map<String, dynamic> payload);

  Stream<List<Map<String, dynamic>>> listenOnChatMessages(String chatId);

  Future<List<Map<String, dynamic>>> getChatMessages(String chatId);
  
}
