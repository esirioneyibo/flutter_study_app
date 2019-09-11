import 'package:flutter_study_app/config.dart';
import 'package:flutter_study_app/pages/home_screen.dart';
import 'package:flutter_study_app/pages/tools_screen.dart';

class ConfigFactory {
  static HomeStyle homeStyle() {
    return HomeStyle();
  }

  static RouterConfig router() {
    return RouterConfig();
  }

  static AppConfig appConfig() {
    return AppConfig();
  }

  static ToolsStyle toolsStyle() {
    return toolsStyle();
  }
}
