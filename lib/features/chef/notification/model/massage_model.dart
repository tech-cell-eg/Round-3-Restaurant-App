class MessageModel {
  final String id;
  final User sender;
  final String content;
  final DateTime time;
  final bool isRead;
  final bool isActive;

  MessageModel({
    required this.id,
    required this.sender,
    required this.content,
    required this.time,
    this.isRead = false,
    this.isActive = false,
  });

  String get timeAgo {
    final now = DateTime.now();
    final difference = now.difference(time);

    if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }
}

class User {
  final String id;
  final String name;
  final String? avatarUrl;
  final DateTime? lastActive;

  User({
    required this.id,
    required this.name,
    this.avatarUrl,
    this.lastActive,
  });

  String get initial => name.isNotEmpty ? name[0] : '?';

  bool get isActive {
    if (lastActive == null) return false;
    final now = DateTime.now();
    return now.difference(lastActive!) < const Duration(minutes: 5);
  }
}