import 'package:flutter/material.dart';
import 'package:flutter_study_app/components/return_bar.dart';
import 'package:flutter_study_app/i10n/localization_intl.dart';
import 'package:flutter_study_app/utils/navigator_util.dart';

class AboutAppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        NavigatorUtil.back(context, details);
      },
      child: Scaffold(
        appBar: ReturnBar(MyLocalizations.of(context).aboutSoftware),
        body: Center(
          child: Text(MyLocalizations.of(context).aboutSoftware),
        ),
      ),
    );
  }
}
