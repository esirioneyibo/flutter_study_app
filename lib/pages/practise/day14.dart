import 'package:flutter/material.dart';
import 'package:flutter_study_app/components/return_bar.dart';

class Day14Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReturnBar('第14天'),
      body: Center(child: Text('第14天')),
    );
  }
}
