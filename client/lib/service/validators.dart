import 'package:flutter/material.dart';
import 'package:flutter_study_app/i18n/fs_localization.dart';

class InputFieldValidator {
  static String validate(BuildContext context, String value) {
    if (value.isEmpty) {
      return FsLocalizations.getLocale(context).commentTips;
    }
    return null;
  }
}
