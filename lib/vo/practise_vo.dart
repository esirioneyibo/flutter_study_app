import 'package:flutter/material.dart';
import 'package:flutter_study_app/pages/practise/day1_screen.dart';
import 'package:flutter_study_app/pages/practise/day2_screen.dart';
import 'package:flutter_study_app/pages/practise/day3_screen.dart';
import 'package:flutter_study_app/pages/practise/day4_screen.dart';
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

class PractiseVo {
  String title;
  Widget screen;
  bool isExpanded;
  List<PractiseVo> children;

  PractiseVo({this.title, this.isExpanded = false, this.screen, this.children});
}

getPractiseList() {
  return [
    PractiseVo(title: '第1天', children: [
      PractiseVo(title: '日期组件', screen: Day1Screen()),
      PractiseVo(title: '时间组件', screen: Day1Screen()),
    ]),
    PractiseVo(title: '第2天', children: [
      PractiseVo(title: '日期组件', screen: Day2Screen()),
      PractiseVo(title: '时间组件', screen: Day2Screen()),
    ]),
    PractiseVo(title: '第3天', children: [
      PractiseVo(title: '日期组件', screen: Day3Screen()),
      PractiseVo(title: '时间组件', screen: Day3Screen()),
    ]),
    PractiseVo(title: '第4天', children: [
      PractiseVo(title: '日期组件', screen: Day4Screen()),
      PractiseVo(title: '时间组件', screen: Day4Screen()),
    ]),
    PractiseVo(title: '第5天', children: [
      PractiseVo(title: '日期组件', screen: Day5Screen()),
      PractiseVo(title: '时间组件', screen: Day5Screen()),
    ]),
    PractiseVo(title: '第6天', children: [
      PractiseVo(title: '日期组件', screen: Day6Screen()),
      PractiseVo(title: '时间组件', screen: Day6Screen()),
    ]),
    PractiseVo(title: '第7天', children: [
      PractiseVo(title: '日期组件', screen: Day7Screen()),
      PractiseVo(title: '时间组件', screen: Day7Screen()),
    ]),
    PractiseVo(title: '第8天', children: [
      PractiseVo(title: '日期组件', screen: Day8Screen()),
      PractiseVo(title: '时间组件', screen: Day8Screen()),
    ]),
    PractiseVo(title: '第9天', children: [
      PractiseVo(title: '日期组件', screen: Day8Screen()),
      PractiseVo(title: '时间组件', screen: Day9Screen()),
    ]),
    PractiseVo(title: '第10天', children: [
      PractiseVo(title: '日期组件', screen: Day10Screen()),
      PractiseVo(title: '时间组件', screen: Day10Screen()),
    ]),
    PractiseVo(title: '第11天', children: [
      PractiseVo(title: '日期组件', screen: Day11Screen()),
      PractiseVo(title: '时间组件', screen: Day11Screen()),
    ]),
    PractiseVo(title: '第12天', children: [
      PractiseVo(title: '日期组件', screen: Day12Screen()),
      PractiseVo(title: '时间组件', screen: Day12Screen()),
    ]),
    PractiseVo(title: '第13天', children: [
      PractiseVo(title: '日期组件', screen: Day13Screen()),
      PractiseVo(title: '时间组件', screen: Day13Screen()),
    ]),
    PractiseVo(title: '第14天', children: [
      PractiseVo(title: '日期组件', screen: Day14Screen()),
      PractiseVo(title: '时间组件', screen: Day14Screen()),
    ]),
    PractiseVo(title: '第15天', children: [
      PractiseVo(title: '日期组件', screen: Day15Screen()),
      PractiseVo(title: '时间组件', screen: Day15Screen()),
    ]),
    PractiseVo(title: '第16天', children: [
      PractiseVo(title: '日期组件', screen: Day16Screen()),
      PractiseVo(title: '时间组件', screen: Day16Screen()),
    ]),
    PractiseVo(title: '第17天', children: [
      PractiseVo(title: '日期组件', screen: Day17Screen()),
      PractiseVo(title: '时间组件', screen: Day17Screen()),
    ]),
    PractiseVo(title: '第18天', children: [
      PractiseVo(title: '日期组件', screen: Day18Screen()),
      PractiseVo(title: '时间组件', screen: Day18Screen()),
    ]),
    PractiseVo(title: '第19天', children: [
      PractiseVo(title: '日期组件', screen: Day19Screen()),
      PractiseVo(title: '时间组件', screen: Day19Screen()),
    ]),
    PractiseVo(title: '第20天', children: [
      PractiseVo(title: '日期组件', screen: Day20Screen()),
      PractiseVo(title: '时间组件', screen: Day20Screen()),
    ]),
    PractiseVo(title: '第21天', children: [
      PractiseVo(title: '日期组件', screen: Day21Screen()),
      PractiseVo(title: '时间组件', screen: Day22Screen()),
    ]),
    PractiseVo(title: '第22天', children: [
      PractiseVo(title: '日期组件', screen: Day23Screen()),
      PractiseVo(title: '时间组件', screen: Day23Screen()),
    ]),
    PractiseVo(title: '第23天', children: [
      PractiseVo(title: '日期组件', screen: Day24Screen()),
      PractiseVo(title: '时间组件', screen: Day24Screen()),
    ]),
    PractiseVo(title: '第24天', children: [
      PractiseVo(title: '日期组件', screen: Day25Screen()),
      PractiseVo(title: '时间组件', screen: Day25Screen()),
    ]),
    PractiseVo(title: '第25天', children: [
      PractiseVo(title: '日期组件', screen: Day26Screen()),
      PractiseVo(title: '时间组件', screen: Day26Screen()),
    ]),
    PractiseVo(title: '第26天', children: [
      PractiseVo(title: '日期组件', screen: Day27Screen()),
      PractiseVo(title: '时间组件', screen: Day27Screen()),
    ]),
    PractiseVo(title: '第27天', children: [
      PractiseVo(title: '日期组件', screen: Day28Screen()),
      PractiseVo(title: '时间组件', screen: Day28Screen()),
    ]),
    PractiseVo(title: '第28天', children: [
      PractiseVo(title: '日期组件', screen: Day29Screen()),
      PractiseVo(title: '时间组件', screen: Day29Screen()),
    ]),
    PractiseVo(title: '第29天', children: [
      PractiseVo(title: '日期组件', screen: Day30Screen()),
      PractiseVo(title: '时间组件', screen: Day30Screen()),
    ]),
    PractiseVo(title: '第30天', children: [
      PractiseVo(title: '日期组件', screen: Day1Screen()),
      PractiseVo(title: '时间组件', screen: Day1Screen()),
    ])
  ];
}
