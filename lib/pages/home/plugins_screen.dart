import 'package:flutter/material.dart';
import 'package:flutter_study_app/factory.dart';
import 'package:flutter_study_app/utils/dialog_util.dart';
import 'package:flutter_study_app/vo/plugins_vo.dart';

class PluginsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PluginsStyle style = ConfigFactory.pluginsStyle();
    return Scaffold(
        body: GridView.count(
      crossAxisCount: style.gridCount,
      childAspectRatio: style.rate,
      mainAxisSpacing: 2,
      children: List.generate(plugins.length, (index) {
        PluginVo blog = plugins[index];
        return InkWell(
          child: Card(
            elevation: style.cardShader,
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(style.cardRadius))),
            child: Column(
              children: <Widget>[
                // 标题
                Container(
                  alignment: Alignment.centerLeft,
                  padding: style.titlePadding,
                  child: Text(
                    blog.title,
                    textAlign: TextAlign.left,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: style.titleFontColor,
                        fontSize: style.titleFontSize),
                  ),
                ),
                Divider(),
                Column(
                  children: <Widget>[
                    Text(
                      'json转dart实体类',
                      style: TextStyle(
                          color: style.contentFontColor,
                          fontSize: style.contentFontSize),
                    ),
                  ],
                )
              ],
            ),
          ),
          onTap: () {
            DialogUtil.showAlertDialog(context, blog.title, blog.desc);
          },
        );
      }),
    ));
  }
}

class PluginsStyle {
  // 每行显示多少个卡片
  int gridCount = 2;

  // 卡片宽高比
  double rate = 5 / 2;

  // 卡片阴影
  double cardShader = 10;

  // 卡片圆角
  double cardRadius = 5;

  // 标题的内边距
  var titlePadding = EdgeInsets.fromLTRB(10, 2, 10, 2);

  // 标题字体大小
  double titleFontSize = 15;

  // 标题字体颜色
  Color titleFontColor = Colors.black;

  // 内容字体大小
  double contentFontSize = 12;

  // 内容字体颜色
  Color contentFontColor = Colors.grey;
}
