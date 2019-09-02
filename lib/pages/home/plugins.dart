import 'package:flutter/material.dart';
import 'package:flutter_study_app/utils/random_util.dart';

class PluginsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    var posts = <Widget>[
//      Icon(Icons.cached, size: 50),
//      Icon(Icons.access_time, size: 50),
//      Icon(Icons.delete_forever, size: 50),
//      Icon(Icons.dehaze, size: 50),
//      Icon(Icons.data_usage, size: 50),
//      Icon(Icons.description, size: 50),
//      Icon(Icons.developer_mode, size: 50),
//      Icon(Icons.access_alarms, size: 50),
//      Icon(Icons.cached, size: 50),
//      Icon(Icons.delete_outline, size: 50),
//      Icon(Icons.get_app, size: 50),
//      Icon(Icons.euro_symbol, size: 50),
//      Icon(Icons.date_range, size: 50),
//      Icon(Icons.face, size: 50),
//      Icon(Icons.cached, size: 50),
//      Icon(Icons.email, size: 50),
//      Icon(Icons.android, size: 50),
//      Icon(Icons.filter_9, size: 50),
//      Icon(Icons.cached, size: 50),
//      Icon(Icons.network_check, size: 50),
//      Icon(Icons.cached, size: 50),
//      Icon(Icons.access_time, size: 50),
//      Icon(Icons.delete_forever, size: 50),
//      Icon(Icons.dehaze, size: 50),
//      Icon(Icons.data_usage, size: 50),
//      Icon(Icons.description, size: 50),
//      Icon(Icons.developer_mode, size: 50),
//      Icon(Icons.access_alarms, size: 50),
//      Icon(Icons.cached, size: 50),
//      Icon(Icons.delete_outline, size: 50),
//      Icon(Icons.get_app, size: 50),
//      Icon(Icons.euro_symbol, size: 50),
//      Icon(Icons.date_range, size: 50),
//      Icon(Icons.face, size: 50),
//      Icon(Icons.cached, size: 50),
//      Icon(Icons.email, size: 50),
//      Icon(Icons.android, size: 50),
//      Icon(Icons.filter_9, size: 50),
//      Icon(Icons.cached, size: 50),
//      Icon(Icons.network_check, size: 50),
//    ];
    return Scaffold(
      backgroundColor: RandomUtil.randomColor(),
      body: Center(
          child: Text(
        '这是插件',
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),
      )),
    );
  }
}
