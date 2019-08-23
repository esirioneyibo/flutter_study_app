import 'package:flutter/material.dart';
import 'package:flutter_study_app/components/MyAppBar.dart';

import '../config.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context,'圈子', AppHeight),
      body: Center(
        child: Text('this is chat screen'),
      ),
    );
  }
}
