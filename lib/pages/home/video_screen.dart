import 'package:flutter/material.dart';
import 'package:flutter_study_app/factory.dart';
import 'package:flutter_study_app/utils/dialog_util.dart';
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
                  borderRadius: BorderRadius.all(
                      Radius.circular(style.cardRadius))),
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
              DialogUtil.showAlertDialog(
                  context, video.title, video.voteCount);
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
    return Stack(
      children: <Widget>[
        // 图片
        Opacity(
          opacity: 0.9,
          child: Image.network(
            video.cover,
            height: 100,
            fit: BoxFit.fitWidth,
          ),
        ),
        // 评论数
        Positioned(
          left: 4,
          bottom: 0,
          child: Row(
            children: <Widget>[
              Icon(
                Icons.menu,
                color: Colors.white,
                size: 12,
              ),
              Text(
                video.commentsCount,
                style: TextStyle(
                    color: Colors.white, fontSize: 12),
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
                style: TextStyle(
                    color: Colors.white, fontSize: 12),
              )
            ],
          ),
        )
      ],
    );
  }
}

class VideoStyle {
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
