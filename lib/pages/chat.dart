import 'package:flutter/material.dart';
import 'package:flutter_study_app/components/my_app_bar.dart';
import 'package:flutter_study_app/models/post.dart';

import '../config.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var posts = Post.posts;

    return Scaffold(
      appBar: MyAppBar(context, '圈子', AppBarHeight),
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
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text(posts[index].title),
                        duration: Duration(milliseconds: 200),
                        action: SnackBarAction(
                            label: '关闭',
                            onPressed: () {
                              Scaffold.of(context).removeCurrentSnackBar();
                            }),
                      ));
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
