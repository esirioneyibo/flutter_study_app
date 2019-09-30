import 'package:flutter/material.dart';
import 'package:flutter_study_app/factory.dart';
import 'package:flutter_study_app/utils/index.dart';
import 'package:flutter_study_app/vo/video_vo.dart';

class VideosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VideoStyle style = ConfigFactory.videoStyle();

    return Scaffold(
      body: GridView.count(
        crossAxisCount: style.gridCount,
        childAspectRatio: style.rate,
        mainAxisSpacing: 2,
        children: List.generate(videos.length, (index) {
          VideoVo video = videos[index];
          return InkWell(
            child: Card(
              elevation: style.cardShader,
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(style.cardRadius))),
              child: Column(
                children: <Widget>[
                  CardImage(video),
                  // 标题
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: style.titlePadding,
                    child: Text(
                      video.title,
                      textAlign: TextAlign.left,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: style.titleFontColor,
                          fontSize: style.titleFontSize),
                    ),
                  ),
                  // 标签
                  Container(
                    padding: style.tagPadding,
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      video.tag,
                      style: TextStyle(
                          color: style.tagFontColor,
                          fontSize: style.tagFontSize),
                    ),
                  )
                ],
              ),
            ),
            onTap: () {
              DialogUtil.showAlertDialog(context, video.title, video.voteCount);
            },
          );
        }),
      ),
    );
  }
}

// 视频顶上的图片
class CardImage extends StatelessWidget {
  final VideoVo video;

  CardImage(this.video);

  @override
  Widget build(BuildContext context) {
    VideoStyle style = ConfigFactory.videoStyle();
    return Stack(
      children: <Widget>[
        // 图片
        Opacity(
          opacity: style.imageOpacity,
          child: Image.network(
            video.cover,
            height: style.imageHeight,
            fit: BoxFit.fitWidth,
          ),
        ),
        // 评论数
        Positioned(
          left: style.commentCountLeft,
          bottom: 0,
          child: Row(
            children: <Widget>[
              Icon(
                Icons.menu,
                color: style.commentIconColor,
                size: style.commentIconSize,
              ),
              Text(
                video.commentsCount,
                style: TextStyle(
                  color: style.commentColor,
                  fontSize: style.commentFontSize,
                ),
              )
            ],
          ),
        ),
        // 点击量
        Positioned(
          bottom: 0,
          left: 50,
          child: Row(
            children: <Widget>[
              Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 12,
              ),
              Text(
                video.voteCount,
                style: TextStyle(color: Colors.white, fontSize: 12),
              )
            ],
          ),
        )
      ],
    );
  }
}

class VideoStyle {
  // 图片透明度
  double imageOpacity = 0.9;

  // 图片高度
  double imageHeight = 90;

  // 评论数
  double commentCountLeft = 4;

  // 评论icon的颜色
  Color commentIconColor = Colors.white;

  // 评论icon的大小
  double commentIconSize = 12;

  // 评论icon的颜色
  Color commentColor = Colors.white;

  // 评论icon的大小
  double commentFontSize = 12;

  // 每行显示多少个卡片
  int gridCount = 2;

  // 卡片宽高比
  double rate = 5 / 4;

  // 卡片阴影
  double cardShader = 10;

  // 卡片圆角
  double cardRadius = 5;

  // 标题的内边距
  var titlePadding = EdgeInsets.fromLTRB(10, 2, 10, 2);

  var tagPadding = EdgeInsets.fromLTRB(10, 2, 10, 2);

  // 标题字体大小
  double titleFontSize = 12;

  // 标题字体颜色
  Color titleFontColor = Colors.black;

  // tag字体大小
  double tagFontSize = 12;

  // tag字体颜色
  Color tagFontColor = Colors.grey;
}
