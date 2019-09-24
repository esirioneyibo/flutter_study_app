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
}
