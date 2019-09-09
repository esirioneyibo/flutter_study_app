import 'package:flutter/material.dart';
import 'package:flutter_study_app/utils/dialog_util.dart';
import 'package:flutter_study_app/vo/blog_vo.dart';

class BlogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.count(
          crossAxisCount:1,
          childAspectRatio: 5 / 2,
          mainAxisSpacing: 2,
          children: List.generate(blogs.length, (index) {
            BlogVo blog = blogs[index];
            return InkWell(
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.all(Radius.circular(5))),
                child: Column(
                  children: <Widget>[
                    // 标题
                    Container(
                      alignment: Alignment.centerLeft,
                      padding:
                      EdgeInsets.fromLTRB(10, 2, 10, 2),
                      child: Text(
                        blog.title,
                        textAlign: TextAlign.left,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                DialogUtil.showAlertDialog(
                    context, blog.title, blog.desc);
              },
            );
          }),
        ));
  }
}
