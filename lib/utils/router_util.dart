import 'package:flutter/material.dart';

class RouterUtil {
  static void push(BuildContext context, route) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => route));
  }
}
