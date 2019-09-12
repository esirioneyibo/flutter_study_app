import 'package:flutter/material.dart';
import 'package:flutter_study_app/factory.dart';
import 'package:flutter_study_app/utils/dialog_util.dart';
import 'package:flutter_study_app/vo/blog_vo.dart';

class BlogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlogStyle style = ConfigFactory.blogStyle();

    return Scaffold(
        body: ListView(
      children: List.generate(blogs.length, (index) {
        BlogVo blog = blogs[index];
        return InkWell(
          child: Card(
            elevation: style.cardShader,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                    Radius.circular(style.cardRadius))),
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
    BlogStyle style = ConfigFactory.blogStyle();
    return Row(
      children: <Widget>[
        Expanded(
            flex: style.imageRate, child: BlogImage(blog)),
        Expanded(
            flex: style.contentRate,
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  padding: style.titlePadding,
                  child: Text(
                    blog.title,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: style.titleColor,
                        fontSize: style.titleFontSize),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: style.descPadding,
                  child: Text(
                    blog.desc,
                    textAlign: TextAlign.left,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: style.descColor,
                        fontSize: style.descFontSize),
                  ),
                ),
              ],
            ))
      ],
    );
  }
}

class BlogStyle {
  // 左侧图片占比  flex布局
  int imageRate = 2;

  // 右侧内容占比
  int contentRate = 3;

  // 卡片阴影
  double cardShader = 10;

  // 圆角大小
  double cardRadius = 5;

  // title的内边距
  var titlePadding = EdgeInsets.fromLTRB(10, 2, 10, 2);

  // 标题文字颜色
  Color titleColor = Colors.black;

  // 标题文字大小
  double titleFontSize = 12;

  // 描述的内边距
  var descPadding = EdgeInsets.fromLTRB(10, 2, 10, 2);

  // 描述文字颜色
  Color descColor = Colors.black;

  // 描述文字大小
  double descFontSize = 12;
}
