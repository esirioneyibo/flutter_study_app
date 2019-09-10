import 'package:flutter/material.dart';
import 'package:flutter_study_app/utils/dialog_util.dart';
import 'package:flutter_study_app/vo/project_vo.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProjectsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: EdgeInsets.all(5),
      children: List.generate(projects.length, (index) {
        ProjectVo project = projects[index];
        return InkWell(
          child: Card(
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black26),
                borderRadius:
                    BorderRadius.all(Radius.circular(4))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  ProjectTitle(project),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding:
                        EdgeInsets.fromLTRB(10, 2, 10, 2),
                    child: Text(
                      project.desc,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13),
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
    return Row(
      children: <Widget>[
        Icon(
          Icons.book,
          color: Colors.black,
        ),
        Container(
            alignment: Alignment.centerLeft,
//            padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
            child: Text(
              project.projectName,
              style: TextStyle(
                  color: Colors.blue[900],
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
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
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                FontAwesomeIcons.solidCircle,
                color: Colors.teal,
                size: 13,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(5, 5, 30, 5),
                child: Text(
                  'Dart',
                  style: TextStyle(
                      color: Colors.black87, fontSize: 13),
                ),
              )
            ],
          ), // language
          Row(
            children: <Widget>[
              Icon(
                FontAwesomeIcons.solidStar,
                color: Colors.black87,
                size: 13,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(5, 5, 30, 5),
                child: Text(
                  '865',
                  style: TextStyle(
                      color: Colors.black87, fontSize: 13),
                ),
              )
            ],
          ), // star
          Row(
            children: <Widget>[
              Icon(
                FontAwesomeIcons.codeBranch,
                color: Colors.black87,
                size: 13,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(5, 5, 30, 5),
                child: Text(
                  '41',
                  style: TextStyle(
                      color: Colors.black87, fontSize: 13),
                ),
              )
            ],
          ), // fork
        ],
      ),
    );
  }
}
