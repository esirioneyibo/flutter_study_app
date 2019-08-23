import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'xiaomo',
      home: Scaffold(
        appBar: AppBar(title: Text('bar')),
        body: Center(
          child: Text('content'),
        ),
      ),
    );
  }
}
