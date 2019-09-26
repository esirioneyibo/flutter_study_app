import 'dart:convert';

import 'package:flutter_study_app/config/api_config.dart';
import 'package:flutter_study_app/config/app_config.dart';
import 'package:flutter_study_app/config/auth_config.dart';
import 'package:flutter_study_app/redux/reducer/user_reducer.dart';
import 'package:flutter_study_app/redux/ys_app_state.dart';
import 'package:flutter_study_app/service/interceptors/token_interceptor.dart';
import 'package:flutter_study_app/service/local_storage.dart';
import 'package:flutter_study_app/utils/http_manager.dart';
import 'package:flutter_study_app/vo/result_data.dart';
import 'package:github/server.dart';
import 'package:redux/redux.dart';

class HttpService {
  static final TokenInterceptors _tokenInterceptors = TokenInterceptors();
  static const CONTENT_TYPE_JSON = "application/json";
  static const CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";

  static IssuesService issuesService;
  static RepositorySlug slug;
  static GitHub github;

  HttpService() {
    github = createGitHubClient(
        auth: new Authentication.withToken(AuthConfig.githubToken));
    slug = RepositorySlug("houko", "flutter-study-app");
    issuesService = IssuesService(github);
  }

  /// 获取聊天列表
  static getChatList() {
    return github.issues.listByRepo(slug);
  }

  /// 获取评论列表
  static getChatComments(issueNumber) {
    return issuesService.listCommentsByIssue(slug, issueNumber);
  }

  /// 添加一个评论
  static addAnComment(Authentication auth, issueId, String data) {
    return github.issues.createComment(slug, issueId, data.trim());
  }

  /// 登录
  static login(
      String username, String password, Store<YsAppState> store) async {
    username = username.trim();
    password = password.trim();
    String type = username + ":" + password;
    var bytes = utf8.encode(type);
    var base64Str = base64.encode(bytes);
    if (AppConfig.debug) {
      print("base64Str login " + base64Str);
    }
    LocalStorage.save(AppConfig.USERNAME, username);
    LocalStorage.save(AppConfig.USER_BASIC_CODE, base64Str);

    Map requestParams = {
      "scopes": ['user', 'repo', 'gist', 'notifications'],
      "note": "admin_script",
      "client_id": AuthConfig.githubClientId,
      "client_secret": AuthConfig.githubClientSecret
    };
    // 发送http请求
    var res = await httpManager.post(
        ApiConfig.getAuthorization(), json.encode(requestParams));
    var resultData;
    if (res != null && res.result) {
      await LocalStorage.save(AppConfig.PASSWORD, password);
      var resultData = await getUserInfo();
      if (AppConfig.debug) {
        print("user result " + resultData.result.toString());
        print(resultData.data);
        print(res.data.toString());
      }
      store.dispatch(new UpdateUserAction(resultData.data));
    }
    return new Result(resultData, res.result);
  }

  ///获取本地登录用户信息
  static getUserInfoLocal() async {
    var userText = await LocalStorage.get(AppConfig.USER_INFO);
    if (userText != null) {
      var userMap = json.decode(userText);
      User user = User.fromJson(userMap);
      return ResultData(user, true, Code.SUCCESS);
    } else {
      return ResultData(null, false, Code.SUCCESS);
    }
  }

  static getUserInfo({Authentication auth}) {
    return null;
  }

  ///获取用户详细信息

  static clearAll(Store store) async {
    _clearAuthorization();
    LocalStorage.remove(AppConfig.USER_INFO);
    store.dispatch(UpdateUserAction(null));
  }

  ///清除授权
  static _clearAuthorization() {
    _tokenInterceptors.clearAuthorization();
  }
}
