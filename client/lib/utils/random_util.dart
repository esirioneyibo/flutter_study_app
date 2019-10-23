import 'dart:math';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class RandomUtil {
  static Color randomColor() {
    return Color.fromARGB(255, Random().nextInt(256) + 0,
        Random().nextInt(256) + 0, Random().nextInt(256) + 0);
  }

  static String randomStr() {
    return Uuid().v1();
  }
}
