
class Message {
  final String id, sendBy, content, time;

  Message._({
    required this.id,
    required this.time,
    required this.sendBy,
    required this.content,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message._(
    id: json['id'],
    time: json['time'],
    sendBy: json['sendBy'],
    content: json['content'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'time': time,
    'sendBy': sendBy,
    'content': content,
  };
}
