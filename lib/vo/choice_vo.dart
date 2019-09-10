import 'package:flutter/material.dart';
import 'package:flutter_study_app/pages/practise/day1_screen.dart';
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
