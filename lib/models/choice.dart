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

  Choice(this.title, this.icon, this.screen);

  static List<Choice> choices = [
    Choice('第1天', Icons.format_list_numbered_rtl, Day1Screen()),
    Choice('第2天', Icons.access_time, Day2Screen()),
    Choice('第3天', Icons.wb_sunny, Day3Screen()),
    Choice('第4天', Icons.settings_input_svideo, Day4Screen()),
    Choice('第5天', Icons.g_translate, Day5Screen()),
    Choice('第6天', Icons.sentiment_very_satisfied, Day6Screen()),
    Choice('第7天', Icons.format_list_numbered_rtl, Day7Screen()),
    Choice('第8天', Icons.access_time, Day8Screen()),
    Choice('第9天', Icons.wb_sunny, Day9Screen()),
    Choice('第10天', Icons.settings_input_svideo, Day10Screen()),
    Choice('第11天', Icons.g_translate, Day11Screen()),
    Choice('第12天', Icons.sentiment_very_satisfied, Day12Screen()),
    Choice('第13天', Icons.format_list_numbered_rtl, Day13Screen()),
    Choice('第14天', Icons.access_time, Day14Screen()),
    Choice('第15天', Icons.wb_sunny, Day15Screen()),
    Choice('第16天', Icons.settings_input_svideo, Day16Screen()),
    Choice('第17天', Icons.g_translate, Day17Screen()),
    Choice('第18天', Icons.sentiment_very_satisfied, Day18Screen()),
    Choice('第19天', Icons.format_list_numbered_rtl, Day19Screen()),
    Choice('第20天', Icons.access_time, Day20Screen()),
    Choice('第21天', Icons.wb_sunny, Day21Screen()),
    Choice('第22天', Icons.settings_input_svideo, Day22Screen()),
    Choice('第23天', Icons.g_translate, Day23Screen()),
    Choice('第24天', Icons.sentiment_very_satisfied, Day24Screen()),
    Choice('第25天', Icons.format_list_numbered_rtl, Day25Screen()),
    Choice('第26天', Icons.access_time, Day26Screen()),
    Choice('第27天', Icons.wb_sunny, Day27Screen()),
    Choice('第28天', Icons.settings_input_svideo, Day28Screen()),
    Choice('第29天', Icons.g_translate, Day29Screen()),
    Choice('第30天', Icons.sentiment_very_satisfied, Day30Screen()),
  ];

  // 学习类
  static List<Choice> studyTools = <Choice>[
    Choice('代办事项', Icons.format_list_numbered_rtl, Day1Screen()),
    Choice('番茄时间', Icons.access_time, Day1Screen()),
    Choice('小决定', Icons.settings_input_svideo, Day1Screen()),
    Choice('翻译', Icons.g_translate, Day1Screen()),
    Choice('今日目标', Icons.sentiment_very_satisfied, Day1Screen()),
    Choice('维基百科', Icons.monetization_on, Day1Screen()),
    Choice('日语转换', Icons.monetization_on, Day1Screen()),
  ];

  static List<Choice> lifeTools = <Choice>[
    Choice('扫二维码', Icons.format_list_numbered_rtl, Day1Screen()),
    Choice('短链接生成', Icons.access_time, Day1Screen()),
    Choice('天气预报', Icons.wb_sunny, Day1Screen()),
    Choice('收款码合并', Icons.settings_input_svideo, Day1Screen()),
    Choice('号码归属地', Icons.g_translate, Day1Screen()),
    Choice('帮你搜索', Icons.sentiment_very_satisfied, Day1Screen()),
    Choice('快递查询', Icons.sentiment_very_satisfied, Day1Screen()),
    Choice('实时汇率', Icons.monetization_on, Day1Screen()),
  ];

  // 媒体类
  static List<Choice> mediaTools = <Choice>[
    Choice('twitter视频', Icons.format_list_numbered_rtl, Day1Screen()),
    Choice('TikTok视频', Icons.access_time, Day1Screen()),
    Choice('哔哩哔哩视频', Icons.wb_sunny, Day1Screen()),
    Choice('图片加水印', Icons.settings_input_svideo, Day1Screen()),
    Choice('图片打码', Icons.g_translate, Day1Screen()),
  ];

  // 编程类
  static List<Choice> programTools = <Choice>[
    Choice('Star曲线', Icons.format_list_numbered_rtl, Day1Screen()),
    Choice('github榜单', Icons.access_time, Day1Screen()),
    Choice('我的github', Icons.wb_sunny, Day1Screen()),
    Choice('好友互follow', Icons.settings_input_svideo, Day1Screen()),
    Choice('编程语言排行', Icons.g_translate, Day1Screen()),
  ];
}
