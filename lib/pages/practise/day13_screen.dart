import 'package:flutter/material.dart';
import 'package:flutter_study_app/components/return_bar.dart';
import 'package:flutter_study_app/utils/navigator_util.dart';

class Day13Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        NavigatorUtil.back(context, details);
      },
      child: Scaffold(
        appBar: ReturnBar('第13天'),
        body: Center(child: Text('第13天')),
      ),
    );
  }
}
