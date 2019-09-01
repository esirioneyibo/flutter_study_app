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

    return Scaffold(
      appBar: MyAppBar(context, '工具'),
      body: ListView(
        children: <Widget>[
          toolsSection,
        ],
      ),
    );
  }
}
