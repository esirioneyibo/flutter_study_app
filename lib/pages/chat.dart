import 'package:flutter/material.dart';
import 'package:flutter_study_app/components/my_app_bar.dart';
import 'package:flutter_study_app/models/post.dart';
import 'package:flutter_study_app/pages/chat/chat_detail.dart';
import 'package:flutter_study_app/utils/router_util.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var posts = Post.posts;

    return Scaffold(
      appBar: MyAppBar(context, '圈子'),
      body: Center(
        child: ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              return Column(
                children: <Widget>[
                  ListTile(
                    title: Text(posts[index].title),
                    leading: Icon(posts[index].icon),
                    subtitle: Text(
                      posts[index].subTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    onTap: () {
                      RouterUtil.push(context, ChatDetailScreen());
                    },
                  ),
                  Divider()
                ],
              );
            }),
      ),
    );
  }
}
