import 'package:flutter/material.dart';
import 'package:flutter_study_app/components/return_bar.dart';
import 'package:flutter_study_app/i10n/localization_intl.dart';

class TwitterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReturnBar(
          MyLocalizations.of(context).returnButton),
      body: Center(child: Text('twitter视频下载')),
    );
  }
}
