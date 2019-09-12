import 'package:flutter/material.dart';
import 'package:flutter_study_app/factory.dart';
import 'package:flutter_study_app/utils/dialog_util.dart';
import 'package:flutter_study_app/vo/project_vo.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProjectsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProjectsStyle style = ConfigFactory.projectsStyle();
    return Scaffold(
        body: ListView(
      padding: style.listPaddingAll,
      children: List.generate(projects.length, (index) {
        ProjectVo project = projects[index];
        return InkWell(
          child: Card(
            shape: RoundedRectangleBorder(
                side: BorderSide(
                    color: style.cardBorderColor),
                borderRadius: BorderRadius.all(
                    Radius.circular(style.cardRadius))),
            child: Padding(
              padding: style.contentPadding,
              child: Column(
                children: <Widget>[
                  ProjectTitle(project),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: style.cardPadding,
                    child: Text(
                      project.desc,
                      maxLines: style.contentLines,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: style.contentFontColor,
                          fontSize: style.contentFontSize),
                    ),
                  ),
                  ProjectBottom(project)
                ],
              ),
            ),
          ),
          onTap: () {
            DialogUtil.showAlertDialog(
                context, project.projectName, project.desc);
          },
        );
      }),
    ));
  }
}

class ProjectTitle extends StatelessWidget {
  final ProjectVo project;

  ProjectTitle(this.project);

  @override
  Widget build(BuildContext context) {
    ProjectsStyle style = ConfigFactory.projectsStyle();
    return Row(
      children: <Widget>[
        Icon(
          Icons.book,
          color: style.bookIconColor,
          size: style.bookIconSize,
        ),
        Container(
            alignment: Alignment.centerLeft,
            child: Text(
              project.projectName,
              style: TextStyle(
                  color: style.nameColor,
                  fontSize: style.nameFontSize,
                  fontWeight: style.nameFontWeight),
            )),
      ],
    );
  }
}

class ProjectBottom extends StatelessWidget {
  final ProjectVo project;

  ProjectBottom(this.project);

  @override
  Widget build(BuildContext context) {
    ProjectsStyle style = ConfigFactory.projectsStyle();

    return Padding(
      padding: style.bottomPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                FontAwesomeIcons.solidCircle,
                color: Colors.teal,
                size: style.languageIconSize,
              ),
              Container(
                padding: style.languageBadgePadding,
                child: Text(
                  'Dart',
                  style: TextStyle(
                      color: style.languageFontColor,
                      fontSize: style.languageFontSize),
                ),
              )
            ],
          ), // language
          Row(
            children: <Widget>[
              Icon(
                FontAwesomeIcons.solidStar,
                color: style.startIconColor,
                size: style.starIconSize,
              ),
              Container(
                padding: style.starBadgePadding,
                child: Text(
                  '865',
                  style: TextStyle(
                      color: style.starFontColor,
                      fontSize: style.starFontSize),
                ),
              )
            ],
          ), // star
          Row(
            children: <Widget>[
              Icon(
                FontAwesomeIcons.codeBranch,
                color: style.forkIconColor,
                size: style.forkIconSize,
              ),
              Container(
                padding: style.forkBadgePadding,
                child: Text(
                  '41',
                  style: TextStyle(
                      color: style.forkFontColor,
                      fontSize: style.forkFontSize),
                ),
              )
            ],
          ), // fork
        ],
      ),
    );
  }
}

class ProjectsStyle {
  // 列表的内边距
  var listPaddingAll = EdgeInsets.all(5);

  // 卡片边框颜色
  Color cardBorderColor = Colors.black26;

  // 卡片圆角
  double cardRadius = 5;

  // 卡片内边距
  var cardPadding = EdgeInsets.fromLTRB(10, 2, 10, 2);

  // 内容内边距
  var contentPadding = EdgeInsets.all(8.0);

  // 内容最大行数
  int contentLines = 4;

  double contentFontSize = 13;

  Color contentFontColor = Colors.black87;

  // 书 icon的颜色
  Color bookIconColor = Colors.black;

  // 书 icon的大小
  double bookIconSize = 15;

  // 名字的颜色
  Color nameColor = Colors.blue[900];

  // 名字的大小
  double nameFontSize = 15;

  // 文字的粗细
  FontWeight nameFontWeight = FontWeight.w500;

  // 卡片内边距
  var bottomPadding = EdgeInsets.fromLTRB(10, 5, 0, 5);

  // 编程语言内边距
  var languageBadgePadding =
      EdgeInsets.fromLTRB(5, 5, 30, 5);

  // star内边距
  var starBadgePadding = EdgeInsets.fromLTRB(5, 5, 30, 5);

  // fork内边距
  var forkBadgePadding = EdgeInsets.fromLTRB(5, 5, 30, 5);

  // 编程语言icon的大小
  double languageIconSize = 13;

  // 编程语言文字大小
  double languageFontSize = 13;

  // 编程语言文字颜色
  Color languageFontColor = Colors.black87;

  // start icon的大小
  double starIconSize = 13;

  // star数 文字大小
  double starFontSize = 13;

  // fork icon的大小
  double forkIconSize = 13;

  // fork 文字的大小
  double forkFontSize = 13;

  // star icon的颜色
  Color startIconColor = Colors.black87;

  // fork icon的颜色
  Color forkIconColor = Colors.black87;

  // star 文字的颜色
  Color starFontColor = Colors.black87;

  // fork 文字的颜色
  Color forkFontColor = Colors.black87;
}
