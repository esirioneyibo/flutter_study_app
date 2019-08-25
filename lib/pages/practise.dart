import 'package:flutter/material.dart';
import 'package:flutter_study_app/components/choice_card.dart';
import 'package:flutter_study_app/components/my_app_bar.dart';
import 'package:flutter_study_app/models/choice.dart';

import '../config.dart';

class PractiseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// 工具列表
    List<Choice> choices = const <Choice>[
      const Choice(title: '第1天', icon: Icons.format_list_numbered_rtl),
      const Choice(title: '第2天', icon: Icons.access_time),
      const Choice(title: '第3天', icon: Icons.wb_sunny),
      const Choice(title: '第4天', icon: Icons.settings_input_svideo),
      const Choice(title: '第5天', icon: Icons.g_translate),
      const Choice(title: '第6天', icon: Icons.sentiment_very_satisfied),
      const Choice(title: '第7天', icon: Icons.format_list_numbered_rtl),
      const Choice(title: '第8天', icon: Icons.access_time),
      const Choice(title: '第9天', icon: Icons.wb_sunny),
      const Choice(title: '第10天', icon: Icons.settings_input_svideo),
      const Choice(title: '第11天', icon: Icons.g_translate),
      const Choice(title: '第12天', icon: Icons.sentiment_very_satisfied),
      const Choice(title: '第13天', icon: Icons.format_list_numbered_rtl),
      const Choice(title: '第14天', icon: Icons.access_time),
      const Choice(title: '第15天', icon: Icons.wb_sunny),
      const Choice(title: '第16天', icon: Icons.settings_input_svideo),
      const Choice(title: '第17天', icon: Icons.g_translate),
      const Choice(title: '第18天', icon: Icons.sentiment_very_satisfied),
      const Choice(title: '第19天', icon: Icons.format_list_numbered_rtl),
      const Choice(title: '第20天', icon: Icons.access_time),
      const Choice(title: '第21天', icon: Icons.wb_sunny),
      const Choice(title: '第22天', icon: Icons.settings_input_svideo),
      const Choice(title: '第23天', icon: Icons.g_translate),
      const Choice(title: '第24天', icon: Icons.sentiment_very_satisfied),
      const Choice(title: '第25天', icon: Icons.format_list_numbered_rtl),
      const Choice(title: '第26天', icon: Icons.access_time),
      const Choice(title: '第27天', icon: Icons.wb_sunny),
      const Choice(title: '第28天', icon: Icons.settings_input_svideo),
      const Choice(title: '第29天', icon: Icons.g_translate),
      const Choice(title: '第30天', icon: Icons.sentiment_very_satisfied),
    ];

    var toolsSection = GridView.count(
      crossAxisCount: 4,
      shrinkWrap: true,
      children: List.generate(choices.length, (index) {
        return Center(
          child: ChoiceCard(choice: choices[index]),
        );
      }),
    );

    return Scaffold(
        appBar: MyAppBar(context, '每日一练', AppBarHeight),
        body: Container(
          child: toolsSection,
        ));
  }
}
