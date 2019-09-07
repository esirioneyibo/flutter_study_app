import 'package:flutter/material.dart';
import 'package:flutter_study_app/pages/practise/day10_screen.dart';
import 'package:flutter_study_app/pages/practise/day11_screen.dart';
import 'package:flutter_study_app/pages/practise/day12_screen.dart';
import 'package:flutter_study_app/pages/practise/day13_screen.dart';
import 'package:flutter_study_app/pages/practise/day14_screen.dart';
import 'package:flutter_study_app/pages/practise/day15_screen.dart';
import 'package:flutter_study_app/pages/practise/day16_screen.dart';
import 'package:flutter_study_app/pages/practise/day17_screen.dart';
import 'package:flutter_study_app/pages/practise/day18_screen.dart';
import 'package:flutter_study_app/pages/practise/day19_screen.dart';
import 'package:flutter_study_app/pages/practise/day1_screen.dart';
import 'package:flutter_study_app/pages/practise/day20_screen.dart';
import 'package:flutter_study_app/pages/practise/day21_screen.dart';
import 'package:flutter_study_app/pages/practise/day22_screen.dart';
import 'package:flutter_study_app/pages/practise/day23_screen.dart';
import 'package:flutter_study_app/pages/practise/day24_screen.dart';
import 'package:flutter_study_app/pages/practise/day25_screen.dart';
import 'package:flutter_study_app/pages/practise/day26_screen.dart';
import 'package:flutter_study_app/pages/practise/day27_screen.dart';
import 'package:flutter_study_app/pages/practise/day28_screen.dart';
import 'package:flutter_study_app/pages/practise/day29_screen.dart';
import 'package:flutter_study_app/pages/practise/day2_screen.dart';
import 'package:flutter_study_app/pages/practise/day30_screen.dart';
import 'package:flutter_study_app/pages/practise/day3_screen.dart';
import 'package:flutter_study_app/pages/practise/day4_screen.dart';
import 'package:flutter_study_app/pages/practise/day5_screen.dart';
import 'package:flutter_study_app/pages/practise/day6_screen.dart';
import 'package:flutter_study_app/pages/practise/day7_screen.dart';
import 'package:flutter_study_app/pages/practise/day8_screen.dart';
import 'package:flutter_study_app/pages/practise/day9_screen.dart';
import 'package:flutter_study_app/pages/tools/develop/github_follow_screen.dart';
import 'package:flutter_study_app/pages/tools/develop/github_profile_screen.dart';
import 'package:flutter_study_app/pages/tools/develop/github_rank_screen.dart';
import 'package:flutter_study_app/pages/tools/develop/github_star_screen.dart';
import 'package:flutter_study_app/pages/tools/develop/language_rank_screen.dart';
import 'package:flutter_study_app/pages/tools/life/combine_pay_screen.dart';
import 'package:flutter_study_app/pages/tools/life/express_screen.dart';
import 'package:flutter_study_app/pages/tools/life/phone_belong_screen.dart';
import 'package:flutter_study_app/pages/tools/life/real_exchange_screen.dart';
import 'package:flutter_study_app/pages/tools/life/short_url_screen.dart';
import 'package:flutter_study_app/pages/tools/life/swap_code_screen.dart';
import 'package:flutter_study_app/pages/tools/life/weather_screen.dart';
import 'package:flutter_study_app/pages/tools/media/bilibili_screen.dart';
import 'package:flutter_study_app/pages/tools/media/long_photo_screen.dart';
import 'package:flutter_study_app/pages/tools/media/photo_mark_screen.dart';
import 'package:flutter_study_app/pages/tools/media/photo_mosaic_screen.dart';
import 'package:flutter_study_app/pages/tools/media/twitter_screen.dart';
import 'package:flutter_study_app/pages/tools/study/japanese_convert_screen.dart';
import 'package:flutter_study_app/pages/tools/study/todolist_screen.dart';
import 'package:flutter_study_app/pages/tools/study/tomato_click_screen.dart';
import 'package:flutter_study_app/pages/tools/study/wiki_screen.dart';

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
      screen: TodoListScreen()),
  Choice(
      title: '番茄时间',
      icon: Icons.access_time,
      screen: TomatoClockScreen()),
  Choice(
      title: '小决定',
      icon: Icons.settings_input_svideo,
      screen: Day1Screen()),
  Choice(
      title: '翻译',
      icon: Icons.g_translate,
      screen: TodoListScreen()),
  Choice(
      title: '今日目标',
      icon: Icons.sentiment_very_satisfied,
      screen: Day1Screen()),
  Choice(
      title: '维基百科',
      icon: Icons.monetization_on,
      screen: WikiScreen()),
  Choice(
      title: '日语转换',
      icon: Icons.monetization_on,
      screen: JapaneseConvertScreen()),
];

final List<Choice> lifeTools = <Choice>[
  Choice(
      title: '扫二维码',
      icon: Icons.format_list_numbered_rtl,
      screen: SwapCodeScreen()),
  Choice(
      title: '短链接生成',
      icon: Icons.access_time,
      screen: ShortUrlScreen()),
  Choice(
      title: '天气预报',
      icon: Icons.wb_sunny,
      screen: WeatherScreen()),
  Choice(
      title: '收款码合并',
      icon: Icons.settings_input_svideo,
      screen: CombinePayScreen()),
  Choice(
      title: '号码归属地',
      icon: Icons.g_translate,
      screen: PhoneBelongScreen()),
  Choice(
      title: '帮你搜索',
      icon: Icons.sentiment_very_satisfied,
      screen: Day1Screen()),
  Choice(
      title: '快递查询',
      icon: Icons.sentiment_very_satisfied,
      screen: ExpressScreen()),
  Choice(
      title: '实时汇率',
      icon: Icons.monetization_on,
      screen: RealExchangeScreen()),
];

// 媒体类
final List<Choice> mediaTools = <Choice>[
  Choice(
      title: 'twitter视频',
      icon: Icons.format_list_numbered_rtl,
      screen: TwitterScreen()),
  Choice(
      title: 'TikTok视频',
      icon: Icons.access_time,
      screen: Day1Screen()),
  Choice(
      title: 'bilibili视频',
      icon: Icons.wb_sunny,
      screen: BilibiliScreen()),
  Choice(
      title: '图片加水印',
      icon: Icons.settings_input_svideo,
      screen: PhotoMarkScreen()),
  Choice(
      title: '截长图',
      icon: Icons.settings_input_svideo,
      screen: LongPhotoScreen()),
  Choice(
      title: '图片打码',
      icon: Icons.g_translate,
      screen: PhotoMosaicScreen()),
];

// 编程类
final List<Choice> programTools = <Choice>[
  Choice(
      title: 'Star曲线',
      icon: Icons.format_list_numbered_rtl,
      screen: GithubStarScreen()),
  Choice(
      title: 'github榜单',
      icon: Icons.access_time,
      screen: GithubRankScreen()),
  Choice(
      title: '我的github',
      icon: Icons.wb_sunny,
      screen: GithubProfileScreen()),
  Choice(
      title: '好友互F',
      icon: Icons.settings_input_svideo,
      screen: GithubFollowScreen()),
  Choice(
      title: '语言排行',
      icon: Icons.g_translate,
      screen: LanguageRankScreen()),
];
