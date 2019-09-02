import 'package:flutter/material.dart';
import 'package:flutter_study_app/components/return_bar.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReturnBar('设置中心'),
      body: Center(
        child: Text('设置中心'),
      ),
    );
  }
}
