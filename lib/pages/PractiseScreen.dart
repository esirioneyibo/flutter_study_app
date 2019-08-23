import 'package:flutter/material.dart';
import 'package:flutter_study_app/components/MyAppBar.dart';

import '../config.dart';

class PractiseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar('每日一练', AppHeight),
      body: Center(
        child: Text('this is practise screen'),
      ),
    );
  }
}
