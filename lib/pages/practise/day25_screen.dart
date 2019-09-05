import 'package:flutter/material.dart';
import 'package:flutter_study_app/components/return_bar.dart';

class Day25Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReturnBar('第25天'),
      body: Center(child: Text('第25天')),
    );
  }
}
