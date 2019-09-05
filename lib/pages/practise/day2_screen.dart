import 'package:flutter/material.dart';
import 'package:flutter_study_app/components/return_bar.dart';

class Day2Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReturnBar('第2天'),
      body: Center(child: Text('第2天')),
    );
  }
}
