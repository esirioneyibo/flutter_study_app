import 'package:flutter/material.dart';
import 'package:flutter_study_app/components/choice_card.dart';
import 'package:flutter_study_app/components/my_app_bar.dart';
import 'package:flutter_study_app/i10n/localization_intl.dart';
import 'package:flutter_study_app/models/choice.dart';

class PractiseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// 工具列表

    var toolsSection = GridView.count(
      crossAxisCount: 4,
      shrinkWrap: true,
      children: List.generate(choices.length, (index) {
        return Center(
          child: ChoiceCard(choice: choices[index]),
        );
      }),
    );

    return Scaffold(
        appBar: MyAppBar(title: MyLocalizations.of(context).study),
        body: Container(
          child: toolsSection,
        ));
  }
}
