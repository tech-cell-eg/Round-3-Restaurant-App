import 'package:intl/intl.dart';

extension DateTimeExtension on String {
  String decodeDate() {
    final milliseconds = int.tryParse(this);
    if (milliseconds == null) return '';

    final dateTime = DateTime.fromMillisecondsSinceEpoch(milliseconds);
    return DateFormat.jm().format(dateTime);
  }

  DateTime encodeDate() {
    final milliseconds = int.tryParse(this);
    if (milliseconds == null) return DateTime.now();

    return DateTime.fromMillisecondsSinceEpoch(milliseconds);
  }
}
