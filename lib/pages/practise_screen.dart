import 'package:flutter/material.dart';
import 'package:flutter_study_app/utils/navigator_util.dart';
import 'package:flutter_study_app/vo/practise_vo.dart';

class PractiseScreen extends StatefulWidget {
  PractiseScreen({Key key}) : super(key: key);

  @override
  _PractiseScreenState createState() =>
      _PractiseScreenState();
}

class _PractiseScreenState extends State<PractiseScreen> {
  List<PractiseVo> _data = getPractiseList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('每日一练'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: _buildPanel(),
        ),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      animationDuration: Duration(milliseconds: 1000),
      children: _data.map<ExpansionPanel>((PractiseVo vo) {
        return ExpansionPanel(
          headerBuilder:
              (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(
                vo.title,
                style: TextStyle(
                  color: isExpanded
                      ? Colors.pink
                      : Colors.black,
                ),
              ),
            );
          },
          body: Column(
            children: vo.children.map((child) {
              return ListTile(
                title: Text(child.title),
                onTap: () {
                  NavigatorUtil.pushWithAnim(context,
                      child.screen, AnimType.Slider);
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
