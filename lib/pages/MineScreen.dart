import 'package:flutter/material.dart';

class MineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('我的')),
      body: Center(
        child: Text('this is mine screen'),
      ),
    );
  }
}
