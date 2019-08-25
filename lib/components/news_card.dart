import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_app/models/news.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({Key key, this.news}) : super(key: key);
  final News news;

  @override
  Widget build(BuildContext context) {
    final TextStyle titleStyle =
        new TextStyle(fontSize: 20, color: Colors.black);
    final TextStyle dateStyle = new TextStyle(fontSize: 20, color: Colors.grey);
    return Card(
      child: Container(
        height: 80,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Icon(news.icon, size: 60, color: titleStyle.color),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(news.title1,
                          style: titleStyle,
                          softWrap: false,
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                      Text(news.date1, style: dateStyle),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(news.title2,
                          style: titleStyle,
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                      Text(news.date2, style: dateStyle),
                    ],
                  )
                ],
              ),
            ]),
      ),
    );
  }
}
