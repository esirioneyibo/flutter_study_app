import 'package:flutter_study_app/app.dart';
import 'package:flutter_study_app/pages/chat/chat_detail_screen.dart';
import 'package:flutter_study_app/pages/chat/new_chat_screen.dart';
import 'package:flutter_study_app/pages/chat/chat_screen.dart';
import 'package:flutter_study_app/pages/home/blog_screen.dart';
import 'package:flutter_study_app/pages/home/plugins_screen.dart';
import 'package:flutter_study_app/pages/home/project_screen.dart';
import 'package:flutter_study_app/pages/home/video_screen.dart';
import 'package:flutter_study_app/pages/home/home_screen.dart';
import 'package:flutter_study_app/pages/mine/login_screen.dart';
import 'package:flutter_study_app/pages/practise/practise_screen.dart';
import 'package:flutter_study_app/pages/tools/tools_screen.dart';
import 'package:flutter_study_app/utils/index.dart';

/// 之所以要在这里用工厂方法创建各个Style是因为Dart代码被声明成static之后不会动态加载
/// 为了能够实时的显示样式的变化而采用这种结构,还有一个原因是整合在一个文件入口中维护更加方便
class ConfigFactory {
  // App 样式
  static AppStyle appStyle() {
    return AppStyle();
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
