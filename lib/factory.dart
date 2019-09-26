import 'package:flutter_study_app/config/app_config.dart';
import 'package:flutter_study_app/config/auth_config.dart';
import 'package:flutter_study_app/config/router_config.dart';
import 'package:flutter_study_app/pages/chat/chat_detail_screen.dart';
import 'package:flutter_study_app/pages/chat/new_chat_screen.dart';
import 'package:flutter_study_app/pages/chat_screen.dart';
import 'package:flutter_study_app/pages/home/blog_screen.dart';
import 'package:flutter_study_app/pages/home/plugins_screen.dart';
import 'package:flutter_study_app/pages/home/project_screen.dart';
import 'package:flutter_study_app/pages/home/video_screen.dart';
import 'package:flutter_study_app/pages/home_screen.dart';
import 'package:flutter_study_app/pages/mine/account_screen.dart';
import 'package:flutter_study_app/pages/practise_screen.dart';
import 'package:flutter_study_app/pages/tools_screen.dart';
import 'package:flutter_study_app/utils/dialog_util.dart';

class ConfigFactory {
  // 路由
  static RouterConfig router() {
    return RouterConfig();
  }

  // App 配置
  static AppConfig appConfig() {
    return AppConfig();
  }

  static AuthConfig authConfig() {
    return AuthConfig();
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

  // 首页视频tab样式
  static VideoStyle videoStyle() {
    return VideoStyle();
  }

  // 首页 插件tab样式
  static PluginsStyle pluginsStyle() {
    return PluginsStyle();
  }

  // 首面 博客tab样式
  static BlogStyle blogStyle() {
    return BlogStyle();
  }

  // 首页开源项目tab样式
  static ProjectsStyle projectsStyle() {
    return ProjectsStyle();
  }

  // 账号页面样式
  static AccountStyle accountStyle() {
    return AccountStyle();
  }

  // dialog样式
  static DialogStyle dialogStyle() {
    return DialogStyle();
  }
}
