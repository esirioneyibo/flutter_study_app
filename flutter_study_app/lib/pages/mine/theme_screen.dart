import 'package:flutter/material.dart';
import 'package:flutter_study_app/model/app_model.dart';
import 'package:flutter_study_app/utils/common_util.dart';
import 'package:flutter_study_app/utils/index.dart';
import 'package:scoped_model/scoped_model.dart';

class ThemeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ThemeScreenState();
}

class ThemeScreenState extends State<ThemeScreen> {
  List<Color> colors = CommonUtil.themeColors();

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppModel>(
      builder: (context, child, model) {
        return Scaffold(
            appBar: AppBar(
              title: Text('切换主题', style: TextStyle(color: Colors.white)),
              iconTheme: IconThemeData(color: Colors.white),
            ),
            body: GestureDetector(
              onHorizontalDragEnd: (DragEndDetails details) {
                NavigatorUtil.back(context, details);
              },
              child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GridView.count(
                    crossAxisCount: 4,
                    children: List.generate(colors.length, (index) {
                      return InkWell(
                        onTap: () {
                          // 修改当前主题
                          model.changeTheme(index);
                          NavigatorUtil.back(context);
                        },
                        child: Container(
                          color: colors[index],
                          margin: const EdgeInsets.all(3.0),
                        ),
                      );
                    }),
                  )),
            ));
      },
    );
  }
}
