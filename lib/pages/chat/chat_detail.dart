import 'package:flutter/material.dart';
import 'package:flutter_study_app/components/return_bar.dart';

class ChatDetailScreen extends StatefulWidget {
  @override
  _ChatDetailScreenState createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReturnBar(""),
      body: Center(
        child: Text("帖子详情"),
      ),
    );
  }
}
