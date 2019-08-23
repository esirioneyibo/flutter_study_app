import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_app/components/ChoiceCard.dart';
import 'package:flutter_study_app/components/NewsCard.dart';
import 'package:flutter_study_app/models/Choice.dart';
import 'package:flutter_study_app/models/News.dart';

class Temp3Screen extends StatelessWidget {
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

    List<Widget> items = <Widget>[
      Container(
        alignment: Alignment.center,
        child: new ListTile(
          title: new Text('这是动态1'),
        ),
      ),
      Container(
        child: new ListTile(
          title: new Text('这是动态2'),
        ),
      ),
      Container(
        child: new ListTile(
          title: new Text('这是动态3'),
        ),
      ),
      Container(
        child: new ListTile(
          title: new Text('这是动态4'),
        ),
      ),
      Container(
        child: new ListTile(
          title: new Text('这是动态5'),
        ),
      )
    ];

    var toolsSection = GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 5,
      shrinkWrap: true,
      children: List.generate(choices.length, (index) {
        return Center(
          child: ChoiceCard(choice: choices[index]),
        );
      }),
    );

    var newsSection = new NewsCard(
        news: News(
            title1: '这里是新闻1',
            date1: '2小时前',
            title2: '这里是新闻2',
            date2: '1小时前',
            icon: Icons.date_range));

    var postsSection = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 15, top: 10),
          child: Text(
            '动态',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.grey, width: 1, style: BorderStyle.solid),
                shape: BoxShape.rectangle),
            child: new ListView(
                shrinkWrap: true,
                physics: new NeverScrollableScrollPhysics(),
                children: ListTile.divideTiles(
                        context: context, tiles: items, color: Colors.black)
                    .toList()))
      ],
    );

    return Scaffold(
      body: ListView(
        children: <Widget>[
          toolsSection,
          newsSection,
          postsSection,
        ],
      ),
    );
  }
}
