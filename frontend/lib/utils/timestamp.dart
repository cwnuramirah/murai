import 'package:intl/intl.dart';

abstract class Timestamp {
  static String fullTime12H(String timestamp) {
    DateTime parsedTime = DateTime.parse(timestamp);
    return DateFormat('hh:mm aa • yyyy/MM/dd').format(parsedTime);
  }

  static String timeAgo(String timestamp) {
    DateTime postTime = DateTime.parse(timestamp);

    DateTime now = DateTime.now().toUtc();

    Duration difference = now.difference(postTime);

    if (difference.inSeconds < 60) {
      return '${difference.inSeconds}s';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d';
    } else if (difference.inDays < 365) {
      return DateFormat('d/MM').format(postTime);
    } else {
      return DateFormat('d/MM/yyyy').format(postTime);
    }
  }
}
