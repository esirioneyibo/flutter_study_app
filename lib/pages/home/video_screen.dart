import 'package:flutter/material.dart';
import 'package:flutter_study_app/components/loading.dart';
import 'package:flutter_study_app/components/no_data.dart';
import 'package:flutter_study_app/factory.dart';
import 'package:flutter_study_app/model/app_model.dart';
import 'package:flutter_study_app/utils/index.dart';
import 'package:flutter_study_app/vo/video_vo.dart';
import 'package:scoped_model/scoped_model.dart';

class VideosScreen extends StatelessWidget {
  final VideoStyle style = ConfigFactory.videoStyle();

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppModel>(
      builder: (context, child, model) {
        model.updateVideos(context);
        return _buildBody(context, model);
      },
    );
  }

  Widget _buildBody(BuildContext context, AppModel model) {
    if (model.videos == null) {
      return Loading();
    } else if (model.videos.isEmpty) {
      return NoData();
    } else {
      return Scaffold(
        body: GridView.count(
          crossAxisCount: style.gridCount,
          childAspectRatio: style.rate,
          mainAxisSpacing: 2,
          children: List.generate(model.videos.length, (index) {
            VideoVo video = model.videos[index];
            return _buildCardContent(context, video);
          }),
        ),
      );
    }
  }

  Widget _buildCardContent(BuildContext context, VideoVo video) {
    return InkWell(
        onTap: () {
          DialogUtil.showAlertDialog(context, video.title, video.voteCount);
        },
        child: Card(
          elevation: style.cardShader,
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(style.cardRadius))),
          child: Column(
            children: <Widget>[
              _buildCardImage(context, video),
              // 标题
              _buildTitle(context, video),
              _buildTag(context, video)
            ],
          ),
        ));
  }

  Widget _buildCardImage(BuildContext context, VideoVo video) {
    return Opacity(
      opacity: style.imageOpacity,
      child: Image.network(
        video.cover,
        height: style.imageHeight,
        fit: BoxFit.fitWidth,
      ),
    );
  }

  Widget _buildTitle(BuildContext context, VideoVo video) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: style.titlePadding,
      child: Text(
        video.title,
        textAlign: TextAlign.left,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            color: style.titleFontColor, fontSize: style.titleFontSize),
      ),
    );
  }

  Widget _buildTag(BuildContext context, VideoVo video) {
    return // 标签
        Container(
      padding: style.tagPadding,
      alignment: Alignment.bottomLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            video.tag,
            style: TextStyle(
                color: style.tagFontColor, fontSize: style.tagFontSize),
          ),
          // 评论数
          Row(
            children: <Widget>[
              Icon(
                Icons.menu,
                color: style.commentIconColor,
                size: style.commentIconSize,
              ),
              SizedBox(
                width: 5,
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
          // 点击量
          Row(
            children: <Widget>[
              Icon(
                Icons.play_arrow,
                color: Colors.grey,
                size: 12,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                video.voteCount,
                style: TextStyle(color: Colors.grey, fontSize: 12),
              )
            ],
          ),
        ],
      ),
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
  Color commentIconColor = Colors.grey;

  // 评论icon的大小
  double commentIconSize = 12;

  // 评论icon的颜色
  Color commentColor = Colors.grey;

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
