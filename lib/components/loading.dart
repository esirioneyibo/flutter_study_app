import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  Loading({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: Center(
            child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Colors.blue),
        )));
  }
}
