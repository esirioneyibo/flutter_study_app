import 'package:flutter/material.dart';
import 'package:flutter_study_app/utils/dialog_util.dart';
import 'package:flutter_study_app/vo/blog_vo.dart';

class BlogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: List.generate(blogs.length, (index) {
        BlogVo blog = blogs[index];
        return InkWell(
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(5))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                BlogItem(blog),
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

// 左边的图片
class BlogImage extends StatelessWidget {
  final BlogVo blog;

  BlogImage(this.blog);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(blog.cover),
    );
  }
}

// 左边图片+右边内容
class BlogItem extends StatelessWidget {
  final BlogVo blog;

  BlogItem(this.blog);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(flex: 2, child: BlogImage(blog)),
        Expanded(
            flex: 3,
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  padding:
                      EdgeInsets.fromLTRB(10, 2, 10, 2),
                  child: Text(
                    blog.title,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.black, fontSize: 12),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding:
                      EdgeInsets.fromLTRB(10, 2, 10, 2),
                  child: Text(
                    blog.desc,
                    textAlign: TextAlign.left,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black, fontSize: 12),
                  ),
                ),
              ],
            ))
      ],
    );
  }
}
