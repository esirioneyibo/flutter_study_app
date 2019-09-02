import 'package:flutter/material.dart';
import 'package:flutter_study_app/components/my_app_bar.dart';
import 'package:flutter_study_app/i10n/localization_intl.dart';
import 'package:flutter_study_app/models/post.dart';
import 'package:flutter_study_app/pages/chat/chat_detail.dart';
import 'package:flutter_study_app/utils/router_util.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: MyAppBar(context, MyLocalizations.of(context).chat),
      body: Container(
        color: Colors.grey,
        child: ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              // 左侧作者信息
              var authInfo = Row(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        posts[index].icon,
                        size: 40,
                      ),
                      Column(
                        children: <Widget>[
                          Text(posts[index].author),
                          Text(
                            posts[index].dateTime,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              );

              // 右侧评论数量
              var commentsSize = Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(5),
                    color: Colors.grey,
                    child: Text(
                      posts[index].tag,
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Icon(
                      Icons.message,
                      color: Colors.grey,
                      size: 15,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      posts[index].comments.length.toString(),
                      style: TextStyle(fontSize: 15),
                    ),
                  )
                ],
              );
              return InkWell(
                onTap: (){
                  RouterUtil.push(context, ChatDetailScreen());
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.all(15),
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(flex: 2, child: authInfo), // 左侧信息
                          Expanded(flex: 1, child: commentsSize), // 右侧评论数
//                        Text("这是上面")
                        ],
                      ),
                      Container(
                          padding: EdgeInsets.only(top: 15),
                          alignment: Alignment.centerLeft,
                          child: Text(posts[index].content,))
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
