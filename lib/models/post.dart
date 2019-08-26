import 'package:flutter/material.dart';

class Post {
  String title;
  String subTitle;
  IconData icon;

  Post(this.title, this.subTitle, this.icon);

  static List<Post> news = [
    Post('动态1', '内容', Icons.save),
    Post('动态2', '内容', Icons.data_usage),
    Post('动态3', '内容', Icons.access_time),
    Post('动态4', '内容', Icons.delete_forever),
    Post('动态5', '内容', Icons.euro_symbol),
    Post('动态6', '内容', Icons.eject),
    Post('动态7', '内容', Icons.favorite),
    Post('动态8', '内容', Icons.delete_outline),
    Post('动态9', '内容', Icons.account_box),
  ];

  static List<Post> posts = [
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
}
