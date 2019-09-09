import 'package:flutter/material.dart';
import 'package:flutter_study_app/utils/dialog_util.dart';
import 'package:flutter_study_app/vo/video_vo.dart';

class VideosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 5 / 4,
        mainAxisSpacing: 2,
        children: List.generate(videos.length, (index) {
          VideoVo video = videos[index];
          return InkWell(
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(5))),
              child: Column(
                children: <Widget>[
                  CardImage(video),
                  // 标题
                  Container(
                    alignment: Alignment.centerLeft,
                    padding:
                        EdgeInsets.fromLTRB(10, 2, 10, 2),
                    child: Text(
                      video.title,
                      textAlign: TextAlign.left,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12),
                    ),
                  ),
                  // 标签
                  Container(
                    padding:
                        EdgeInsets.fromLTRB(10, 2, 10, 2),
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      video.tag,
                      style: TextStyle(
                          color: Colors.grey, fontSize: 12),
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
