import 'package:flutter/material.dart';
import 'package:flutter_study_app/components/my_app_bar.dart';
import 'package:flutter_study_app/factory.dart';
import 'package:flutter_study_app/i18n/fs_localization.dart';
import 'package:flutter_study_app/utils/index.dart';
import 'package:flutter_study_app/vo/choice_vo.dart';

class ToolsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// 工具列表
    ToolsStyle style = ConfigFactory.toolsStyle();
    var tools = getStudyTools();
    final studySection = GridView.count(
      crossAxisCount: style.gridCount,
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
      crossAxisCount: style.gridCount,
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
      crossAxisCount: style.gridCount,
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
      crossAxisCount: style.gridCount,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: List.generate(programTools.length, (index) {
        return Center(
          child: ChoiceCard(choice: programTools[index]),
        );
      }),
    );

    TextStyle textStyle = TextStyle(
        color: style.categoryTitleColor,
        fontSize: style.categoryTitleSize,
        fontWeight: style.categoryTitleFontWeight);

    return Scaffold(
      appBar: MyAppBar(
        title: FsLocalizations.getLocale(context).tool,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: style.titlePadding,
            child: Container(
              width: 10,
              child: Text(
                FsLocalizations.getLocale(context).studyTools,
                style: textStyle,
              ),
            ),
          ),
          studySection,
          Padding(
            padding: style.titlePadding,
            child: Container(
              width: 10,
              child: Text(
                FsLocalizations.getLocale(context).lifeTools,
                style: textStyle,
              ),
            ),
          ),
          lifeSection,
          Padding(
            padding: style.titlePadding,
            child: Container(
              width: 10,
              child: Text(
                FsLocalizations.getLocale(context).mediaTools,
                style: textStyle,
              ),
            ),
          ),
          mediaSection,
          Padding(
            padding: style.titlePadding,
            child: Container(
              width: style.categoryTitleContainerSize,
              child: Text(
                FsLocalizations.getLocale(context).developTools,
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
  const ChoiceCard({Key key, this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    ToolsStyle style = ConfigFactory.toolsStyle();
    final TextStyle textStyle =
        TextStyle(fontSize: style.fontSize, color: style.fontColor);

    final TextStyle iconStyle =
        TextStyle(fontSize: style.gridIconSize, color: style.iconColor);
    return Card(
        color: style.cardColor,
        child: Center(
            child: InkWell(
          onTap: () {
            NavigatorUtil.pushWithAnim(context, choice.screen, style.animType);
          },
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(choice.icon,
                    size: style.choiceIconSize, color: iconStyle.color),
                Text(choice.title, style: textStyle),
              ]),
        )));
  }
}

class ToolsStyle {
  // 每个格子的大小
  double choiceIconSize = 30;

  // 每行显示多少个格子
  int gridCount = 4;

  // 格子中的图片的大小
  double gridIconSize = 15;

  // 文字大小
  double fontSize = 15;

  // 文字颜色
  Color fontColor = Colors.black;

  // icon颜色
  Color iconColor = RandomUtil.randomColor();

  Color cardColor = Colors.white;

  // 路由跳转动画
  AnimType animType = AnimType.Slider;

  // 分类大标题颜色
  Color categoryTitleColor = Colors.blue;

  // 分类大标题文字大小
  double categoryTitleSize = 24;

  // 大标题 font weight
  FontWeight categoryTitleFontWeight = FontWeight.bold;

  // 大标题距四周的内边距
  var titlePadding = EdgeInsets.fromLTRB(10, 20, 5, 0);

  // 分类大标题容器的大小
  double categoryTitleContainerSize = 10;
}
