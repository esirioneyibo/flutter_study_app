import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_study_app/components/loading.dart';
import 'package:flutter_study_app/components/no_data.dart';
import 'package:flutter_study_app/components/return_bar.dart';
import 'package:flutter_study_app/factory.dart';
import 'package:flutter_study_app/i18n/fs_localization.dart';
import 'package:flutter_study_app/model/app_model.dart';
import 'package:flutter_study_app/service/http_service.dart';
import 'package:flutter_study_app/utils/index.dart';
import 'package:flutter_study_app/utils/time_util.dart';
import 'package:flutter_study_app/vo/bottom_item_vo.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:github/server.dart';
import 'package:scoped_model/scoped_model.dart';

class ChatDetailScreen extends StatefulWidget {
  ChatDetailScreen(this.post);

  final Issue post;

  @override
  State<StatefulWidget> createState() {
    return ChatDetailState(post);
  }
}

class ChatDetailState extends State<ChatDetailScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController _controller;
  ScrollController _scrollController = ScrollController();
  ChatDetailStyle style = ConfigFactory.chatDetailStyle();
  Issue post;
  bool isTop = true;
  List<IssueComment> comments;

  ChatDetailState(this.post);

  @override
  void initState() {
    super.initState();
    getCommentListData();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppModel>(
      builder: (context, child, model) {
        return Scaffold(
            appBar: ReturnBar(FsLocalizations.getLocale(context).chatContent),
            bottomNavigationBar: _buildBottomBar(),
            body: GestureDetector(
                onHorizontalDragEnd: (DragEndDetails details) {
                  NavigatorUtil.back(context, details);
                },
                child: ListView(
                  shrinkWrap: true,
                  controller: _scrollController,
                  children: [
                    _buildPostContent(),
                    // 评论列表
                    _buildComments(),
                    // 评论框
                    _buildCommentInput(model)
                  ],
                )));
      },
    );
  }

  /// 获取评论列表
  getCommentListData() {
    HttpService.getChatComments(post.number).then((data) {
      setState(() {
        if (data == null) {
          comments = [];
        }
        comments = data;
      });
    });
  }

  Widget _buildBottomBar() {
    var items = [
      TabItem(index: 1, icon: Icons.favorite, title: ''),
      TabItem(index: 2, icon: Icons.share, title: ''),
      TabItem(index: 3, icon: Icons.save, title: ''),
    ];

    return BottomNavigationBar(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.grey,
      unselectedItemColor: Colors.grey,
      elevation: 0,
      items: items.map((item) {
        return BottomNavigationBarItem(
            icon: Icon(item.icon), title: Text(item.title));
      }).toList(),
      onTap: null,
    );
  }

  /// 验证和保存
  bool _validateAndComment() {
    final FormState state = formKey.currentState;
    if (state.validate()) {
      state.save();
      return true;
    }
    return false;
  }

  // 添加一个评论 发送http请求
  addAnComment(BuildContext context, AppModel model, String data) {
    if (!model.isLogin()) {
      NavigatorUtil.goLogin(context);
      return;
    }
    _controller.clear();
    HttpService.addAnComment(post.number, data);
  }

  /// build post content
  Widget _buildPostContent() {
    return Card(
        child: Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // 左侧信息
            _buildAuthorInfo(),
            _buildTag(), // 右侧小标签
          ],
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(style.titlePaddingAll),
          child: MarkdownBody(data: post.title),
        ),
        // 标题
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(style.contentPaddingAll),
          child: MarkdownBody(data: post.body),
        ),
        // 内容
      ],
    ));
  }

  /// 作者信息
  Widget _buildAuthorInfo() {
    return Expanded(
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(style.avatarPaddingAll),
            height: style.avatarSize,
            width: style.avatarSize,
            child: CircleAvatar(
              backgroundImage: NetworkImage(post.user.avatarUrl),
              backgroundColor: Colors.grey,
              radius: style.avatarRadius,
            ), // 头像
          ),
          Container(
            height: style.authorContainerHeight,
            alignment: Alignment.centerLeft,
            child: Column(
              children: <Widget>[
                Text(
                  post.user.login,
                  style: TextStyle(
                      fontSize: style.authorFontSize,
                      color: style.authorFontColor,
                      fontWeight: style.authorFontWeight),
                ), // 作者
                Text(
                  TimeUtil.format(post.createdAt),
                  style: TextStyle(
                      fontSize: style.authorFontSize,
                      fontWeight: style.authorFontWeight,
                      color: style.authorFontColor),
                ), // 时间
              ],
            ),
          ),
        ],
      ),
    );
  }

  ///标签
  Widget _buildTag() {
    return Container(
      height: style.badgeContainerHeight,
      padding: style.badgePadding,
      alignment: Alignment.topRight,
      child: Chip(
          backgroundColor: style.badgeBackgroundColor,
          label: Text(
            post.state,
            style: TextStyle(
                color: style.badgeColor, fontSize: style.badgeFontSize),
          )),
    );
  }

  /// 评论列表
  Widget _buildComments() {
    if (comments == null) {
      return Loading();
    } else if (comments.isEmpty) {
      return NoData(tips: FsLocalizations.getLocale(context).noComment);
    } else {
      return Container(
        child: Column(
          children: comments
              .asMap()
              .map((index, comment) {
                return MapEntry(index, _buildCommentCard(index, comment));
              })
              .values
              .toList(), // 评论列表
        ),
      );
    }
  }

  // comment card
  Widget _buildCommentCard(index, IssueComment comment) {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            key: Key(comment.id.toString()),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(comment.user.avatarUrl),
            ),
            trailing: Text('${index + 1}楼'),
            subtitle: Text(comment.body),
            title: Text(comment.user.login),
          ),
          Container(
            child: ActionChip(
                label: Icon(FontAwesomeIcons.heart), onPressed: () => {}),
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: style.likeButtonPaddingRight),
          )
        ],
      ),
    );
  }

  /// 构建评论框
  Widget _buildCommentInput(AppModel model) {
    return Card(
      elevation: 0,
      child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10),
                child: TextFormField(
                  key: Key('new_comment'),
                  keyboardType: TextInputType.text,
                  minLines: 3,
                  maxLines: 100,
                  decoration: InputDecoration(
                    hintText: FsLocalizations.getLocale(context).comment,
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                  ),
                  validator: (value) =>
                      CommentFieldValidator.validate(context, value),
                  onSaved: (String data) {
                    addAnComment(context, model, data);
                  },
                  controller: _controller,
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 10),
                alignment: Alignment.centerRight,
                child: RaisedButton(
                  color: style.commentButtonColor,
                  key: Key('comment'),
                  child: Text(FsLocalizations.getLocale(context).comment,
                      style: TextStyle(
                          fontSize: style.commentButtonSize,
                          color: style.commentFontColor)),
                  onPressed: _validateAndComment,
                ),
              ),
            ],
          )),
    );
  }
}

class CommentFieldValidator {
  static String validate(BuildContext context, String value) {
    if (value.isEmpty) {
      return FsLocalizations.getLocale(context).commentTips;
    }
    return null;
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

  Color commentButtonColor = Colors.green;

  Color commentFontColor = Colors.white;

  double commentButtonSize = 12;
}
