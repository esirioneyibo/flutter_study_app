import 'package:flutter_study_app/config.dart';
import 'package:flutter_study_app/pages/chat/chat_detail_screen.dart';
import 'package:flutter_study_app/pages/chat/new_chat_screen.dart';
import 'package:flutter_study_app/pages/chat_screen.dart';
import 'package:flutter_study_app/pages/home_screen.dart';
import 'package:flutter_study_app/pages/practise_screen.dart';
import 'package:flutter_study_app/pages/tools_screen.dart';

class ConfigFactory {
  // 路由
  static RouterConfig router() {
    return RouterConfig();
  }

  // App 配置
  static AppConfig appConfig() {
    return AppConfig();
  }

  // 首页样式
  static HomeStyle homeStyle() {
    return HomeStyle();
  }

  // 工具主界面样式
  static ToolsStyle toolsStyle() {
    return ToolsStyle();
  }

  // 圈子主界面样式
  static ChatStyle chatStyle() {
    return ChatStyle();
  }

  // 每日一练主界面样式
  static PractiseStyle practiseStyle() {
    return PractiseStyle();
  }

  // 聊天详情样式
  static ChatDetailStyle chatDetailStyle() {
    return ChatDetailStyle();
  }

  // 发表帖子的样式
  static NewChatStyle newChatStyle() {
    return NewChatStyle();
  }
}
