import 'package:flutter/material.dart';
import 'package:flutter_study_app/components/my_app_bar.dart';

import '../../config.dart';

class MineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context, '我的', AppBarHeight),
      body: Center(
        child: Text('this is mine screen'),
      ),
    );
  }
}
