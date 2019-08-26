import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;

  static List<Choice> choices = [
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

  static List<Choice> tools = const <Choice>[
    const Choice(title: '代办事项', icon: Icons.format_list_numbered_rtl),
    const Choice(title: '番茄时间', icon: Icons.access_time),
    const Choice(title: '天气预报', icon: Icons.wb_sunny),
    const Choice(title: '小决定', icon: Icons.settings_input_svideo),
    const Choice(title: '翻译', icon: Icons.g_translate),
    const Choice(title: '今日目标', icon: Icons.sentiment_very_satisfied),
    const Choice(title: '实时汇率', icon: Icons.monetization_on),
    const Choice(title: '更多工具', icon: Icons.filter_9_plus),
  ];
}
