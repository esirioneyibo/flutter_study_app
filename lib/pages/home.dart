import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_app/components/choice_card.dart';
import 'package:flutter_study_app/components/my_app_bar.dart';
import 'package:flutter_study_app/components/news_card.dart';
import 'package:flutter_study_app/models/choice.dart';
import 'package:flutter_study_app/models/news.dart';
import 'package:flutter_study_app/models/post.dart';

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
      const Choice(title: '实时汇率', icon: Icons.monetization_on),
      const Choice(title: '更多工具', icon: Icons.filter_9_plus),
    ];

    List<Post> posts = [
      Post('动态1', '内容', Icons.save),
      Post('动态2', '内容', Icons.data_usage),
      Post('动态3', '内容', Icons.access_time),
      Post('动态4', '内容', Icons.delete_forever),
      Post('动态5', '内容', Icons.euro_symbol),
      Post('动态6', '内容', Icons.eject),
      Post('动态7', '内容', Icons.favorite),
      Post('动态8', '内容', Icons.delete_outline),
      Post('动态9', '内容', Icons.account_box),
    ];

    var toolsSection = GridView.count(
      crossAxisCount: 4,
      physics: new NeverScrollableScrollPhysics(),
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
            child: ListView.builder(
                itemCount: posts.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      ListTile(
                        title: new Text(posts[index].title),
                        onTap: () {
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text(posts[index].title),
                            duration: Duration(milliseconds: 200),
                            action: SnackBarAction(
                                label: '关闭',
                                onPressed: () {
                                  Scaffold.of(context).removeCurrentSnackBar();
                                }),
                          ));
                        },
                      ),
                      Divider()
                    ],
                  );
                }))
      ],
    );

    return Scaffold(
      appBar: MyAppBar(context, '首页', AppBarHeight),
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
