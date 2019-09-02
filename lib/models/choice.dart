import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_app/pages/practise/day1.dart';
import 'package:flutter_study_app/pages/practise/day10.dart';
import 'package:flutter_study_app/pages/practise/day11.dart';
import 'package:flutter_study_app/pages/practise/day12.dart';
import 'package:flutter_study_app/pages/practise/day13.dart';
import 'package:flutter_study_app/pages/practise/day14.dart';
import 'package:flutter_study_app/pages/practise/day15.dart';
import 'package:flutter_study_app/pages/practise/day16.dart';
import 'package:flutter_study_app/pages/practise/day17.dart';
import 'package:flutter_study_app/pages/practise/day18.dart';
import 'package:flutter_study_app/pages/practise/day19.dart';
import 'package:flutter_study_app/pages/practise/day2.dart';
import 'package:flutter_study_app/pages/practise/day20.dart';
import 'package:flutter_study_app/pages/practise/day21.dart';
import 'package:flutter_study_app/pages/practise/day22.dart';
import 'package:flutter_study_app/pages/practise/day23.dart';
import 'package:flutter_study_app/pages/practise/day24.dart';
import 'package:flutter_study_app/pages/practise/day25.dart';
import 'package:flutter_study_app/pages/practise/day26.dart';
import 'package:flutter_study_app/pages/practise/day27.dart';
import 'package:flutter_study_app/pages/practise/day28.dart';
import 'package:flutter_study_app/pages/practise/day29.dart';
import 'package:flutter_study_app/pages/practise/day3.dart';
import 'package:flutter_study_app/pages/practise/day30.dart';
import 'package:flutter_study_app/pages/practise/day4.dart';
import 'package:flutter_study_app/pages/practise/day5.dart';
import 'package:flutter_study_app/pages/practise/day6.dart';
import 'package:flutter_study_app/pages/practise/day7.dart';
import 'package:flutter_study_app/pages/practise/day8.dart';
import 'package:flutter_study_app/pages/practise/day9.dart';

class Choice {
  final String title;
  final IconData icon;
  final Widget screen;

  Choice({this.title, this.icon, this.screen});
}

List<Choice> choices = [
  Choice(
      title: '第1天',
      icon: Icons.format_list_numbered_rtl,
      screen: Day1Screen()),
  Choice(
      title: '第2天',
      icon: Icons.access_time,
      screen: Day2Screen()),
  Choice(
      title: '第3天',
      icon: Icons.wb_sunny,
      screen: Day3Screen()),
  Choice(
      title: '第4天',
      icon: Icons.settings_input_svideo,
      screen: Day4Screen()),
  Choice(
      title: '第5天',
      icon: Icons.g_translate,
      screen: Day5Screen()),
  Choice(
      title: '第6天',
      icon: Icons.sentiment_very_satisfied,
      screen: Day6Screen()),
  Choice(
      title: '第7天',
      icon: Icons.format_list_numbered_rtl,
      screen: Day7Screen()),
  Choice(
      title: '第8天',
      icon: Icons.access_time,
      screen: Day8Screen()),
  Choice(
      title: '第9天',
      icon: Icons.wb_sunny,
      screen: Day9Screen()),
  Choice(
      title: '第10天',
      icon: Icons.settings_input_svideo,
      screen: Day10Screen()),
  Choice(
      title: '第11天',
      icon: Icons.g_translate,
      screen: Day11Screen()),
  Choice(
      title: '第12天',
      icon: Icons.sentiment_very_satisfied,
      screen: Day12Screen()),
  Choice(
      title: '第13天',
      icon: Icons.format_list_numbered_rtl,
      screen: Day13Screen()),
  Choice(
      title: '第14天',
      icon: Icons.access_time,
      screen: Day14Screen()),
  Choice(
      title: '第15天',
      icon: Icons.wb_sunny,
      screen: Day15Screen()),
  Choice(
      title: '第16天',
      icon: Icons.settings_input_svideo,
      screen: Day16Screen()),
  Choice(
      title: '第17天',
      icon: Icons.g_translate,
      screen: Day17Screen()),
  Choice(
      title: '第18天',
      icon: Icons.sentiment_very_satisfied,
      screen: Day18Screen()),
  Choice(
      title: '第19天',
      icon: Icons.format_list_numbered_rtl,
      screen: Day19Screen()),
  Choice(
      title: '第20天',
      icon: Icons.access_time,
      screen: Day20Screen()),
  Choice(
      title: '第21天',
      icon: Icons.wb_sunny,
      screen: Day21Screen()),
  Choice(
      title: '第22天',
      icon: Icons.settings_input_svideo,
      screen: Day22Screen()),
  Choice(
      title: '第23天',
      icon: Icons.g_translate,
      screen: Day23Screen()),
  Choice(
      title: '第24天',
      icon: Icons.sentiment_very_satisfied,
      screen: Day24Screen()),
  Choice(
      title: '第25天',
      icon: Icons.format_list_numbered_rtl,
      screen: Day25Screen()),
  Choice(
      title: '第26天',
      icon: Icons.access_time,
      screen: Day26Screen()),
  Choice(
      title: '第27天',
      icon: Icons.wb_sunny,
      screen: Day27Screen()),
  Choice(
      title: '第28天',
      icon: Icons.settings_input_svideo,
      screen: Day28Screen()),
  Choice(
      title: '第29天',
      icon: Icons.g_translate,
      screen: Day29Screen()),
  Choice(
      title: '第30天',
      icon: Icons.sentiment_very_satisfied,
      screen: Day30Screen()),
];

// 学习类
final List<Choice> studyTools = <Choice>[
  Choice(
      title: '代办事项',
      icon: Icons.format_list_numbered_rtl,
      screen: Day1Screen()),
  Choice(
      title: '番茄时间',
      icon: Icons.access_time,
      screen: Day1Screen()),
  Choice(
      title: '小决定',
      icon: Icons.settings_input_svideo,
      screen: Day1Screen()),
  Choice(
      title: '翻译',
      icon: Icons.g_translate,
      screen: Day1Screen()),
  Choice(
      title: '今日目标',
      icon: Icons.sentiment_very_satisfied,
      screen: Day1Screen()),
  Choice(
      title: '维基百科',
      icon: Icons.monetization_on,
      screen: Day1Screen()),
  Choice(
      title: '日语转换',
      icon: Icons.monetization_on,
      screen: Day1Screen()),
];

final List<Choice> lifeTools = <Choice>[
  Choice(
      title: '扫二维码',
      icon: Icons.format_list_numbered_rtl,
      screen: Day1Screen()),
  Choice(
      title: '短链接生成',
      icon: Icons.access_time,
      screen: Day1Screen()),
  Choice(
      title: '天气预报',
      icon: Icons.wb_sunny,
      screen: Day1Screen()),
  Choice(
      title: '收款码合并',
      icon: Icons.settings_input_svideo,
      screen: Day1Screen()),
  Choice(
      title: '号码归属地',
      icon: Icons.g_translate,
      screen: Day1Screen()),
  Choice(
      title: '帮你搜索',
      icon: Icons.sentiment_very_satisfied,
      screen: Day1Screen()),
  Choice(
      title: '快递查询',
      icon: Icons.sentiment_very_satisfied,
      screen: Day1Screen()),
  Choice(
      title: '实时汇率',
      icon: Icons.monetization_on,
      screen: Day1Screen()),
];

// 媒体类
final List<Choice> mediaTools = <Choice>[
  Choice(
      title: 'twitter视频',
      icon: Icons.format_list_numbered_rtl,
      screen: Day1Screen()),
  Choice(
      title: 'TikTok视频',
      icon: Icons.access_time,
      screen: Day1Screen()),
  Choice(
      title: 'bilibili视频',
      icon: Icons.wb_sunny,
      screen: Day1Screen()),
  Choice(
      title: '图片加水印',
      icon: Icons.settings_input_svideo,
      screen: Day1Screen()),
  Choice(
      title: '图片打码',
      icon: Icons.g_translate,
      screen: Day1Screen()),
];

// 编程类
final List<Choice> programTools = <Choice>[
  Choice(
      title: 'Star曲线',
      icon: Icons.format_list_numbered_rtl,
      screen: Day1Screen()),
  Choice(
      title: 'github榜单',
      icon: Icons.access_time,
      screen: Day1Screen()),
  Choice(
      title: '我的github',
      icon: Icons.wb_sunny,
      screen: Day1Screen()),
  Choice(
      title: '好友互F',
      icon: Icons.settings_input_svideo,
      screen: Day1Screen()),
  Choice(
      title: '语言排行',
      icon: Icons.g_translate,
      screen: Day1Screen()),
];
