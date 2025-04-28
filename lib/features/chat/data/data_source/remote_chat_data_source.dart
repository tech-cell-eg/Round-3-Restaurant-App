import 'package:food_app/core/extensions/string.dart';
import 'package:food_app/core/firebase/firebase.dart';
import 'package:food_app/features/chat/data/data_source/base_chat_data_source.dart';

class RemoteChatDataSource implements BaseChatDataSource {
  final Firebase _firebase = Firebase();

  @override
  Future<List<Map<String, dynamic>>> getChatMessages(String chatId) async {
    try {
      return await _firebase.database.ref('chats/$chatId/messages').get().then((
        snapshot,
      ) {
        if (snapshot.exists) {
          final data = snapshot.value as Map<dynamic, dynamic>;
          return data.entries
              .map((e) {
                final messageData = Map<String, dynamic>.from(e.value);
                return {'id': e.key, ...messageData};
              })
              .toList()
              .reversed
              .toList();
        } else {
          return [];
        }
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Stream<List<Map<String, dynamic>>> listenOnChatMessages(String chatId) {
    try {
      return _firebase.database
          .ref('chats/$chatId/messages')
          .orderByChild('time')
          .onValue
          .map((event) {
            final data = event.snapshot.value;
            if (data == null) return [];

            final rawMap = Map<dynamic, dynamic>.from(data as Map);
            final messages =
                rawMap.entries.map((e) {
                  return Map<String, dynamic>.from(e.value);
                }).toList();

            messages.sort((a, b) {
              final timeA = a['time'].toString().encodeDate();
              final timeB = b['time'].toString().encodeDate();
              return timeA.compareTo(timeB);
            });
            return messages;
          });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> sendMessage(String chatId, Map<String, dynamic> payload) async {
    try {
      await _firebase.database
          .ref('chats/$chatId/messages')
          .child(payload['id'])
          .set(payload);
      return true;
    } catch (e) {
      rethrow;
    }
  }



}
