import 'dart:math';

import 'package:flutter/material.dart';

class RandomUtil {
  static Color randomColor() {
    return Color.fromARGB(255, Random().nextInt(256) + 0,
        Random().nextInt(256) + 0, Random().nextInt(256) + 0);
  }
}
