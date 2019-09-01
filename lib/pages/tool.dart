import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_app/components/choice_card.dart';
import 'package:flutter_study_app/components/my_app_bar.dart';
import 'package:flutter_study_app/i10n/localization_intl.dart';
import 'package:flutter_study_app/models/choice.dart';

class ToolScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// 工具列表
    List<Choice> studyTools = Choice.studyTools;
    List<Choice> lifeTools = Choice.lifeTools;
    List<Choice> mediaTools = Choice.mediaTools;
    List<Choice> programTools = Choice.programTools;

    var studySection = GridView.count(
      crossAxisCount: 4,
      physics: new NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: List.generate(studyTools.length, (index) {
        return Center(
          child: ChoiceCard(choice: studyTools[index]),
        );
      }),
    );

    var lifeSection = GridView.count(
      crossAxisCount: 4,
      physics: new NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: List.generate(lifeTools.length, (index) {
        return Center(
          child: ChoiceCard(choice: lifeTools[index]),
        );
      }),
    );

    var mediaSection = GridView.count(
      crossAxisCount: 4,
      physics: new NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: List.generate(mediaTools.length, (index) {
        return Center(
          child: ChoiceCard(choice: mediaTools[index]),
        );
      }),
    );

    var programSection = GridView.count(
      crossAxisCount: 4,
      physics: new NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: List.generate(programTools.length, (index) {
        return Center(
          child: ChoiceCard(choice: programTools[index]),
        );
      }),
    );

    const toolStyle = TextStyle(
        color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold);

    var titlePadding = EdgeInsets.fromLTRB(10, 20, 5, 0);

    return Scaffold(
      appBar: MyAppBar(context, MyLocalizations.of(context).tool),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: titlePadding,
            child: Container(
              width: 10,
              color: Colors.blue,
              child: Text(
                "学习类",
                style: toolStyle,
              ),
            ),
          ),
          studySection,
          Padding(
            padding: titlePadding,
            child: Container(
              width: 10,
              color: Colors.blue,
              child: Text(
                "生活类",
                style: toolStyle,
              ),
            ),
          ),
          lifeSection,
          Padding(
            padding: titlePadding,
            child: Container(
              width: 10,
              color: Colors.blue,
              child: Text(
                "媒体类",
                style: toolStyle,
              ),
            ),
          ),
          mediaSection,
          Padding(
            padding: titlePadding,
            child: Container(
              width: 10,
              color: Colors.blue,
              child: Text(
                "编程类",
                style: toolStyle,
              ),
            ),
          ),
          programSection,
        ],
      ),
    );
  }
}
