import 'package:intl/intl.dart';

class ConvertText {

  String convertTimestamp(String timeText) {
    DateTime _nowJst = DateTime.now().toLocal();
    DateTime _createdAt = DateFormat('EEE MMM d hh:mm:ss +0000 yyyy','en_US').parse(timeText, true);
    DateTime _createdAtJst = _createdAt.add(Duration(hours: 9));
    Duration difference = _nowJst.difference(_createdAt);

    if (difference.inSeconds <= 59) {
      return '${difference.inSeconds}秒';
    }

    if (difference.inMinutes <= 59) {
      return '${difference.inMinutes}分';
    }

    if (difference.inHours <= 23) {
      return '${difference.inHours}時間';
    }

    if (difference.inDays <= 6) {
      return '${difference.inDays}日';
    }

    if (7 <= difference.inDays && difference.inDays <= 30) {
      return '${_createdAtJst.month}月${_createdAtJst.day}日';
    }

    return '${_createdAtJst.year}年${_createdAtJst.month}月${_createdAtJst.day}日';
  }
}