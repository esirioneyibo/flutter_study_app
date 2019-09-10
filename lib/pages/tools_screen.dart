import 'package:flutter/material.dart';
import 'package:flutter_study_app/components/choice_card.dart';
import 'package:flutter_study_app/i10n/localization_intl.dart';
import 'package:flutter_study_app/vo/choice_vo.dart';

class ToolsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// 工具列表

    final studySection = GridView.count(
      crossAxisCount: 4,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: List.generate(studyTools.length, (index) {
        return Center(
          child: ChoiceCard(choice: studyTools[index]),
        );
      }),
    );

    final lifeSection = GridView.count(
      crossAxisCount: 4,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: List.generate(lifeTools.length, (index) {
        return Center(
          child: ChoiceCard(choice: lifeTools[index]),
        );
      }),
    );

    final mediaSection = GridView.count(
      crossAxisCount: 4,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: List.generate(mediaTools.length, (index) {
        return Center(
          child: ChoiceCard(choice: mediaTools[index]),
        );
      }),
    );

    final programSection = GridView.count(
      crossAxisCount: 4,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: List.generate(programTools.length, (index) {
        return Center(
          child: ChoiceCard(choice: programTools[index]),
        );
      }),
    );

    const textStyle = TextStyle(
        color: Colors.blue,
        fontSize: 24,
        fontWeight: FontWeight.bold);

    final titlePadding = EdgeInsets.fromLTRB(10, 20, 5, 0);

    return Scaffold(
      appBar: AppBar(
          title: Text(MyLocalizations.of(context).tool)),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: titlePadding,
            child: Container(
              width: 10,
              child: Text(
                MyLocalizations.of(context).studyTools,
                style: textStyle,
              ),
            ),
          ),
          studySection,
          Padding(
            padding: titlePadding,
            child: Container(
              width: 10,
              child: Text(
                MyLocalizations.of(context).lifeTools,
                style: textStyle,
              ),
            ),
          ),
          lifeSection,
          Padding(
            padding: titlePadding,
            child: Container(
              width: 10,
              child: Text(
                MyLocalizations.of(context).mediaTools,
                style: textStyle,
              ),
            ),
          ),
          mediaSection,
          Padding(
            padding: titlePadding,
            child: Container(
              width: 10,
              child: Text(
                MyLocalizations.of(context).developTools,
                style: textStyle,
              ),
            ),
          ),
          programSection,
        ],
      ),
    );
  }
}
