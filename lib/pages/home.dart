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
    List<Choice> tools = Choice.tools;
    // 新闻动态
    List<Post> posts = Post.news;

    var toolsSection = GridView.count(
      crossAxisCount: 4,
      physics: new NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: List.generate(tools.length, (index) {
        return Center(
          child: ChoiceCard(choice: tools[index]),
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
      appBar: MyAppBar(context, '首页'),
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
