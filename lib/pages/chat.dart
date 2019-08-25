import 'package:flutter/material.dart';
import 'package:flutter_study_app/components/my_app_bar.dart';
import 'package:flutter_study_app/models/post.dart';

import '../config.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Post> posts = [
      Post('这是标题1', '假装有内容假装有内容假装有内容假装有内容假装有内容假装有内容', Icons.monetization_on),
      Post('这是标题2', '假装有内容假装有内容假装有内容假装有内容假装有内容假装有内容', Icons.satellite),
      Post('这是标题3', '假装有内容假装有内容假装有内容假装有内容假装有内容假装有内容', Icons.access_alarm),
      Post('这是标题4', '假装有内容假装有内容假装有内容假装有内容假装有内容假装有内容', Icons.email),
      Post('这是标题5', '假装有内容假装有内容假装有内容假装有内容假装有内容假装有内容', Icons.backup),
      Post('这是标题6', '假装有内容假装有内容假装有内容假装有内容假装有内容假装有内容', Icons.gamepad),
      Post('这是标题7', '假装有内容假装有内容假装有内容假装有内容假装有内容假装有内容', Icons.backspace),
      Post('这是标题8', '假装有内容假装有内容假装有内容假装有内容假装有内容假装有内容', Icons.filter),
      Post('这是标题9', '假装有内容假装有内容假装有内容假装有内容假装有内容假装有内容', Icons.adjust),
      Post(
          '这是标题10', '假装有内容假装有内容假装有内容假装有内容假装有内容假装有内容', Icons.image_aspect_ratio),
      Post('这是标题11', '假装有内容假装有内容假装有内容假装有内容假装有内容假装有内容', Icons.hdr_off),
      Post('这是标题12', '假装有内容假装有内容假装有内容假装有内容假装有内容假装有内容',
          Icons.keyboard_arrow_down),
      Post('这是标题13', '假装有内容假装有内容假装有内容假装有内容假装有内容假装有内容', Icons.monetization_on),
      Post('这是标题14', '假装有内容假装有内容假装有内容假装有内容假装有内容假装有内容', Icons.label_outline),
      Post('这是标题15', '假装有内容假装有内容假装有内容假装有内容假装有内容假装有内容', Icons.nature_people),
      Post('这是标题16', '假装有内容假装有内容假装有内容假装有内容假装有内容假装有内容', Icons.offline_pin),
      Post('这是标题17', '假装有内容假装有内容假装有内容假装有内容假装有内容假装有内容', Icons.palette),
      Post('这是标题18', '假装有内容假装有内容假装有内容假装有内容假装有内容假装有内容', Icons.question_answer),
      Post('这是标题19', '假装有内容假装有内容假装有内容假装有内容假装有内容假装有内容',
          Icons.radio_button_checked),
      Post('这是标题20', '假装有内容假装有内容假装有内容假装有内容假装有内容假装有内容', Icons.save),
    ];

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
