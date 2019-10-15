import 'package:intl/intl.dart';

class TimeUtil {
  static String nowOfMillsStr() {
    return DateTime.now().millisecond.toString();
  }

  static int nowOfMills() {
    return DateTime.now().millisecond;
  }

  static String format(dynamic time) {
    var dateFormat = DateFormat('MM-dd HH:mm');
    if (time is String) {
      return dateFormat.format(DateTime.parse(time));
    } else if (time is DateTime) {
      return dateFormat.format(time);
    }
    return '参数有误';
  }

  ///format milliseconds to local string
  String getFormattedTime(int milliseconds) {
    var dateTime = DateTime.fromMillisecondsSinceEpoch(milliseconds);
    var now = DateTime.now();

    var diff = Duration(
        milliseconds:
            now.millisecondsSinceEpoch - dateTime.millisecondsSinceEpoch);
    if (diff.inMinutes < 1) {
      return "刚刚";
    }
    if (diff.inMinutes <= 60) {
      return "${diff.inMinutes}分钟前";
    }
    if (diff.inHours <= 24) {
      return "${diff.inHours}小时前";
    }
    if (diff.inDays <= 5) {
      return "${diff.inDays}天前";
    }
    return DateFormat("y年M月d日").format(dateTime);
  }

  ///format milliseconds to time stamp like "06:23", which
  ///means 6 minute 23 seconds
  String getTimeStamp(int milliseconds) {
    int seconds = (milliseconds / 1000).truncate();
    int minutes = (seconds / 60).truncate();

    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');

    return "$minutesStr:$secondsStr";
  }
}
