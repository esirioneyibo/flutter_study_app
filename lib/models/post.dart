import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Post {
  // 唯一id
  String id = Uuid().v1();

  // 文章标题
  String title;

  // 文章内容
  String content;

  // 作者名字
  String author;

  // 作者头像
  IconData icon;

  // 标签
  String tag;

  // 时间
  String dateTime;

  // 评论
  List<Comment> comments;

  Post(this.title, this.content, this.author, this.icon, this.tag,
      this.dateTime, this.comments);
}

class Comment {
  String id = Uuid().v1();
  String author;
  IconData icon;
  String content;
  DateTime time;
}

final List<Post> posts = [
  Post('EGO ', 'To the divided steak add bagel, margerine, iced tea and tangy rice.', '小莫', Icons.people, 'flutter',
      '${DateTime.now().hour}:${DateTime.now().minute}', List()),
  Post('CHICKEN ', 'Shores sing with endurance!', '小莫', Icons.print, 'flutter',
      '${DateTime.now().hour}:${DateTime.now().minute}', List()),
  Post('FURNER ', 'Treasure, faith, and power.', '小莫', Icons.hourglass_empty,
      'flutter', '${DateTime.now().hour}:${DateTime.now().minute}', List()),
  Post('COCKROACH ', 'Collision course at the habitat oddlyred alert was the paralysis of flight, invaded to a carnivorous phenomenan.', '小莫', Icons.adb, 'flutter',
      '${DateTime.now().hour}:${DateTime.now().minute}', List()),
  Post('VOGON ', 'Particles fly with rumour!', '小莫', Icons.home, 'flutter',
      '${DateTime.now().hour}:${DateTime.now().minute}', List()),
  Post('TOFU ', 'It is an evil friendship, sir.', '小莫', Icons.email, 'flutter',
      '${DateTime.now().hour}:${DateTime.now().minute}', List()),
];
