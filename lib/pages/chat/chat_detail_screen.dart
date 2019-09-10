import 'package:flutter/material.dart';
import 'package:flutter_study_app/components/return_bar.dart';
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
    return Scaffold(
      appBar: ReturnBar(
          MyLocalizations.of(context).chatContent),
      floatingActionButton: Container(
        height: 40,
        width: 40,
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
                duration: const Duration(milliseconds: 500),
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
                            padding: EdgeInsets.all(10),
                            height: 60,
                            width: 60,
                            child: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(post.icon),
                              backgroundColor: Colors.grey,
                              radius: 60,
                            ), // 头像
                          ),
                          Container(
                            height: 50,
                            alignment: Alignment.centerLeft,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  post.author,
                                  style: TextStyle(
                                      fontWeight:
                                          FontWeight.w400,
                                      fontFamily: '微软雅黑'),
                                ), // 作者
                                Text(
                                  post.dateTime,
                                  style: TextStyle(
                                      color: Colors.grey),
                                ), // 时间
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      height: 50,
                      padding:
                          EdgeInsets.fromLTRB(0, 0, 5, 20),
                      alignment: Alignment.topRight,
                      child: Chip(
                          backgroundColor: Colors.grey[200],
                          label: Text(
                            post.tag,
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12),
                          )),
                    ), // 右侧小表标签
                  ],
                ),
                //--------------------------------------------------------------
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(10),
                  child: Text(post.title),
                ),
                // 标题
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(10),
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
                          padding:
                              EdgeInsets.only(right: 10),
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
