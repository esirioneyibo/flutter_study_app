import 'package:flutter/material.dart';
import 'package:flutter_study_app/components/return_bar.dart';
import 'package:flutter_study_app/factory.dart';
import 'package:flutter_study_app/i10n/localization_intl.dart';
import 'package:flutter_study_app/utils/navigator_util.dart';
import 'package:flutter_study_app/vo/post_vo.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatDetailScreen extends StatefulWidget {
  ChatDetailScreen(this.post);

  final Post post;

  @override
  State<StatefulWidget> createState() {
    return ChatDetailState(post);
  }
}

class ChatDetailState extends State<ChatDetailScreen> {
  final Post post;
  ScrollController _scrollController = ScrollController();

  ChatDetailState(this.post);

  bool isTop = true;

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ChatDetailStyle style = ConfigFactory.chatDetailStyle();

    return Scaffold(
      appBar: ReturnBar(
          MyLocalizations.of(context).chatContent),
      floatingActionButton: Container(
        height: style.scrollButtonSize,
        width: style.scrollButtonSize,
        child: FloatingActionButton(
            tooltip: isTop ? '到达底部' : '返回顶部',
            child: Icon(isTop
                ? Icons.arrow_downward
                : Icons.arrow_upward),
            onPressed: () {
              var pos = isTop
                  ? _scrollController
                      .position.maxScrollExtent
                  : _scrollController
                      .position.minScrollExtent;

              _scrollController.animateTo(
                pos,
                curve: Curves.easeOut,
                duration: Duration(
                    milliseconds: style.scrollSpeed),
              );
              setState(() {
                isTop = !isTop;
              });
            }),
      ),
      body: GestureDetector(
        onHorizontalDragEnd: (DragEndDetails details) {
          NavigatorUtil.back(context, details);
        },
        child: ListView(
          shrinkWrap: true,
          controller: _scrollController,
          children: <Widget>[
            Card(
                child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.start,
                  children: <Widget>[
                    // 左侧信息
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(
                                style.avatarPaddingAll),
                            height: style.avatarSize,
                            width: style.avatarSize,
                            child: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(post.icon),
                              backgroundColor: Colors.grey,
                              radius: style.avatarRadius,
                            ), // 头像
                          ),
                          Container(
                            height:
                                style.authorContainerHeight,
                            alignment: Alignment.centerLeft,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  post.author,
                                  style: TextStyle(
                                      fontSize: style
                                          .authorFontSize,
                                      color: style
                                          .authorFontColor,
                                      fontWeight: style
                                          .authorFontWeight),
                                ), // 作者
                                Text(
                                  post.dateTime,
                                  style: TextStyle(
                                      fontSize: style
                                          .authorFontSize,
                                      fontWeight: style
                                          .authorFontWeight,
                                      color: style
                                          .authorFontColor),
                                ), // 时间
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      height: style.badgeContainerHeight,
                      padding: style.badgePadding,
                      alignment: Alignment.topRight,
                      child: Chip(
                          backgroundColor:
                              style.badgeBackgroundColor,
                          label: Text(
                            post.tag,
                            style: TextStyle(
                                color: style.badgeColor,
                                fontSize:
                                    style.badgeFontSize),
                          )),
                    ), // 右侧小标签
                  ],
                ),
                //--------------------------------------------------------------
                Container(
                  alignment: Alignment.centerLeft,
                  padding:
                      EdgeInsets.all(style.titlePaddingAll),
                  child: Text(post.title),
                ),
                // 标题
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(
                      style.contentPaddingAll),
                  child: Text(post.content),
                ),
                // 内容
              ],
            )),
            Container(
              child: Column(
                children: post.comments.map((comment) {
                  return Card(
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          key: Key(comment.id),
                          leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(comment.icon),
                          ),
                          trailing: Text('${comment.id}楼'),
                          subtitle: Text(comment.content),
                          title: Text(comment.author),
                        ),
                        Container(
                          child: ActionChip(
                              label: Icon(
                                  FontAwesomeIcons.heart),
                              onPressed: () => {}),
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(
                              right: style
                                  .likeButtonPaddingRight),
                        )
                      ],
                    ),
                  );
                }).toList(), // 评论列表
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatDetailStyle {
  // 到底底部，到底顶部的按钮大小
  double scrollButtonSize = 40;

  // 到底底部和到达顶部的滑动速度 单位：毫秒
  int scrollSpeed = 500;

  // 头像大小
  double avatarSize = 60;

  // 头像圆角
  double avatarRadius = 60;

  // 头像的内边距
  double avatarPaddingAll = 10;

  // 作者容器的高度
  double authorContainerHeight = 50;

  // 作者的字体大小
  double authorFontSize = 15;

  // 作者的字体颜色
  Color authorFontColor = Colors.black;

  // 作者的font weight
  FontWeight authorFontWeight = FontWeight.w300;

  // 右侧小标签的高度
  double badgeContainerHeight = 50;

  // 小标签的内边距
  var badgePadding = EdgeInsets.fromLTRB(0, 0, 5, 20);

  // badge的背景颜色
  Color badgeBackgroundColor = Colors.grey[200];

  // badge的文字颜色
  Color badgeColor = Colors.grey;

  // 标签的文字大小
  double badgeFontSize = 12;

  // 标题的内边距
  double titlePaddingAll = 10;

  // 内容的内边距
  double contentPaddingAll = 10;

  // 评论点赞按钮距右的距离
  double likeButtonPaddingRight = 10;
}
