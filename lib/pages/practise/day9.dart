import 'package:flutter/material.dart';
import 'package:flutter_study_app/components/return_bar.dart';

class Day9Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReturnBar('第09天'),
      body: Center(child: Text('第09天')),
    );
  }
}
