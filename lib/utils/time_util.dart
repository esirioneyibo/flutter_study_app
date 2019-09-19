import 'package:intl/intl.dart';

class TimeUtil {
  static String nowOfMillsStr() {
    return DateTime.now().millisecond.toString();
  }

  static int nowOfMills() {
    return DateTime.now().millisecond;
  }

  static String format(String time) {
    return DateFormat('MM-dd HH:mm').format(DateTime.parse(time));
  }
}
