import 'package:flutter/material.dart';
import 'package:flutter_study_app/config.dart';
import 'package:flutter_study_app/factory.dart';
import 'package:flutter_study_app/i10n/localization_intl.dart';
import 'package:flutter_study_app/utils/navigator_util.dart';
import 'package:flutter_study_app/utils/random_util.dart';
import 'package:flutter_study_app/vo/choice_vo.dart';

class ToolsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// 工具列表

    var tools = getStudyTools();
    final studySection = GridView.count(
      crossAxisCount: 4,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: List.generate(tools.length, (index) {
        return Center(
          child: ChoiceCard(choice: tools[index]),
        );
      }),
    );

    var lifeTools = getLifeTools();
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

    var mediaTools = getMediaTools();
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

    var programTools = getProgramTools();
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

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice})
      : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    ToolsStyle toolStyle = ConfigFactory.toolsStyle();
    final TextStyle textStyle =
        TextStyle(fontSize: 15, color: Colors.black);

    final TextStyle iconStyle = TextStyle(
        fontSize: 15, color: RandomUtil.randomColor());
    return Card(
        color: Colors.white,
        child: Center(
            child: InkWell(
          onTap: () {
            NavigatorUtil.pushWithAnim(
                context, choice.screen, AnimType.Slider);
          },
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(choice.icon,
                    size: toolStyle.choiceIconSize,
                    color: iconStyle.color),
                Text(choice.title, style: textStyle),
              ]),
        )));
  }
}

class ToolsStyle {
  double choiceIconSize = 30;
}
