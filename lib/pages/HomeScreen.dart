import 'package:flutter/material.dart';
import 'package:flutter_study_app/components/ChoiceCard.dart';
import 'package:flutter_study_app/components/MyAppBar.dart';
import 'package:flutter_study_app/models/Choice.dart';

import '../config.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// 工具列表
    List<Choice> choices = const <Choice>[
      const Choice(title: '代办事项', icon: Icons.format_list_numbered_rtl),
      const Choice(title: '番茄时间', icon: Icons.access_time),
      const Choice(title: '天气预报', icon: Icons.wb_sunny),
      const Choice(title: '小决定', icon: Icons.settings_input_svideo),
      const Choice(title: '翻译', icon: Icons.g_translate),
      const Choice(title: '今日目标', icon: Icons.sentiment_very_satisfied),
    ];

    var tools = GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 5,
      children: List.generate(choices.length, (index) {
        return Center(
          child: ChoiceCard(choice: choices[index]),
        );
      }),
    );

    return Scaffold(
        appBar: MyAppBar(context, '首页', AppHeight),
        body: Center(
          child: tools,
        ));
  }
}
