import 'package:flutter/material.dart';
import 'package:flutter_study_app/components/return_bar.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReturnBar('关于软件'),
      body: Center(
        child: Text('关于软件'),
      ),
    );
  }
}
