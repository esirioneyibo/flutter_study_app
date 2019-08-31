import 'package:flutter/material.dart';
import 'package:flutter_study_app/components/my_app_bar.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context, '设置'),
      body: Center(
        child: Text('this is about screen'),
      ),
    );
  }
}
