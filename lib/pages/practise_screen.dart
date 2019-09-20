import 'package:flutter/material.dart';
import 'package:flutter_study_app/factory.dart';
import 'package:flutter_study_app/i10n/localization_intl.dart';
import 'package:flutter_study_app/utils/navigator_util.dart';
import 'package:flutter_study_app/vo/practise_vo.dart';

class PractiseScreen extends StatefulWidget {
  PractiseScreen({Key key}) : super(key: key);

  @override
  _PractiseScreenState createState() => _PractiseScreenState();
}

class _PractiseScreenState extends State<PractiseScreen> {
  List<PractiseVo> _data = getPractiseList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(MyLocalizations.of(context).study),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: _buildPanel(),
        ),
      ),
    );
  }

  Widget _buildPanel() {
    PractiseStyle style = ConfigFactory.practiseStyle();
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      animationDuration: Duration(milliseconds: style.toggleSpeed),
      children: _data.map<ExpansionPanel>((PractiseVo vo) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(
                vo.title,
                style: TextStyle(
                  color: isExpanded
                      ? style.titleOpenedColor
                      : style.titleClosedColor,
                ),
              ),
            );
          },
          body: Column(
            children: vo.children.map((child) {
              return ListTile(
                title: Text(child.title),
                onTap: () {
                  NavigatorUtil.pushWithAnim(
                      context, child.screen, AnimType.Slider);
                },
              );
            }).toList(),
          ),
          isExpanded: vo.isExpanded,
        );
      }).toList(),
    );
  }
}

class PractiseStyle {
  // 列表展开的速度 单位 毫秒
  int toggleSpeed = 300;

  // 关闭状态的标题颜色
  Color titleClosedColor = Colors.black;

  // 打开状态的标题颜色
  Color titleOpenedColor = Colors.pink;
}
