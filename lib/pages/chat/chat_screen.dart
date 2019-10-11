import 'package:flutter/material.dart';
import 'package:flutter_github_api/flutter_github_api.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_study_app/components/loading.dart';
import 'package:flutter_study_app/components/no_data.dart';
import 'package:flutter_study_app/factory.dart';
import 'package:flutter_study_app/i18n/fs_localization.dart';
import 'package:flutter_study_app/model/app_model.dart';
import 'package:flutter_study_app/pages/chat/chat_detail_screen.dart';
import 'package:flutter_study_app/pages/chat/new_chat_screen.dart';
import 'package:flutter_study_app/utils/index.dart';
import 'package:scoped_model/scoped_model.dart';

class ChatScreen extends StatelessWidget {
  final ChatStyle style = ConfigFactory.chatStyle();

  @override
  Widget build(BuildContext context) {
    AppModel model = CommonUtil.getModel(context);
    model.updatePosts(context);
    return ScopedModelDescendant<AppModel>(
      builder: (context, child, model) {
        return Scaffold(
            appBar:
                AppBar(title: Text(FsLocalizations.getLocale(context).chat)),
            floatingActionButton: _buildNewChatButton(context),
            body: _buildBody(context, model));
      },
    );
  }

  /// new chat button
  Widget _buildNewChatButton(BuildContext context) {
    return Container(
      height: style.newChatButtonSize,
      width: style.newChatButtonSize,
      child: FloatingActionButton(
          tooltip: FsLocalizations.getLocale(context).newChat,
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(
            style.newChatButtonIcon,
          ),
          onPressed: () {
            NavigatorUtil.pushWithAnim(
                context, NewChatScreen(), AnimType.Slider);
          }),
    );
  }

  /// body
  Widget _buildBody(BuildContext context, AppModel model) {
    model.updatePosts(context);
    if (model.posts == null) {
      return Loading();
    } else if (model.posts.isEmpty) {
      return NoData();
    } else {
      return RefreshIndicator(
        onRefresh: () => model.updatePosts(context),
        child: Container(
          color: style.background,
          child: ListView.builder(
              itemCount: model.posts.length,
              itemBuilder: (context, index) {
                final post = model.posts[index];
                return InkWell(
                  onTap: () => NavigatorUtil.pushWithAnim(context,
                      ChatDetailScreen(model.posts[index]), AnimType.Slider),
                  child: _buildCard(post),
                );
              }),
        ),
      );
    }
  }

  /// card
  Widget _buildCard(Issue post) {
    return Card(
      child: Container(
        margin: EdgeInsets.only(bottom: style.cardMarginBottom),
        padding: EdgeInsets.all(style.cardPaddingAll),
        color: style.cardColor,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(flex: 2, child: _buildLeftUserInfo(post)),
                Expanded(flex: 1, child: _buildRightCommentInfo(post)),
              ],
            ),
            // 帖子標題
            Container(
                padding: EdgeInsets.only(top: style.chatContentPaddingTop),
                alignment: Alignment.centerLeft,
                child: MarkdownBody(
                  data: post.title,
                ))
          ],
        ),
      ),
    );
  }

  /// 左侧用户信息
  /// 左右布局，左侧头像， 右侧上下布局 上为用户名，下为最后回复
  /// Icon ｜ 用户名
  /// Icon ｜最后回复
  Widget _buildLeftUserInfo(post) {
    return Row(
      children: <Widget>[
        Row(
          children: <Widget>[
            Image(
              image: NetworkImage(post.user.avatarUrl),
              width: style.avatarSize,
              height: style.avatarSize,
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                children: <Widget>[
                  Text(post.user.login),
                  Text(
                    TimeUtil.format(post.createdAt),
                    style: TextStyle(color: style.authorColor),
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }

  /// 右侧信息
  Widget _buildRightCommentInfo(Issue post) {
    return Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(style.tagMarginAll),
          padding: EdgeInsets.all(style.tagPaddingAll),
          color: style.tagColor,
          child: Text(
            post.state,
            style: TextStyle(fontSize: style.tagSize),
          ),
        ),
        Container(
          margin: EdgeInsets.all(style.messageIconMarginAll),
          child: Icon(
            Icons.message,
            color: style.messageIconColor,
            size: style.messageIconSize,
          ),
        ),
        Container(
          margin: EdgeInsets.all(style.messageTextMarginAll),
          child: Text(
            post.commentsCount.toString(),
            style: TextStyle(fontSize: style.messageTextFontSize),
          ),
        )
      ],
    );
  }
}

class ChatStyle {
  // 发布帖子的浮动按钮大小
  double newChatButtonSize = 40;

  // 聊天列表的背景颜色 卡片与卡片之间间隔漏出来的颜色
  Color background = Colors.grey[50];

  // 发布帖子的浮动按钮的图标
  IconData newChatButtonIcon = Icons.add;

  // 卡片居下的外边距
  double cardMarginBottom = 5;

  // 卡片四周的内边距
  double cardPaddingAll = 15;

  // 卡片的颜色
  Color cardColor = Colors.white;

  // 帖子内容距离顶部的内边距
  double chatContentPaddingTop = 15;

  // 内容显示的最大行数，多余的被切掉显示3个点 ...
  int maxLines = 3;

  // 发帖人的头像大小
  double avatarSize = 40;

  // 发帖人名字的颜色
  Color authorColor = Colors.grey;

  // 右侧badge的内边距
  double tagMarginAll = 5;

  // 右侧badge的外边距
  double tagPaddingAll = 5;

  // 标签的大小
  double tagSize = 5;

  // tag的颜色
  Color tagColor = Colors.grey;

  // 消息条数的颜色
  Color messageIconColor = Colors.grey;

  // 消息条数的大小
  double messageIconSize = 15;

  // 消息条数的外边距
  double messageIconMarginAll = 5;

  // 消息文本大小
  double messageTextFontSize = 15;

  // 消息文本颜色
  Color messageTextColor = Colors.grey;

  //消息文本外边距
  double messageTextMarginAll = 5;
}
