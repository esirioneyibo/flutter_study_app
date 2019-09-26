import 'dart:convert';

import 'package:flutter_study_app/config/api_config.dart';
import 'package:flutter_study_app/config/app_config.dart';
import 'package:flutter_study_app/config/auth_config.dart';
import 'package:flutter_study_app/redux/reducer/user_reducer.dart';
import 'package:flutter_study_app/service/interceptors/token_interceptor.dart';
import 'package:flutter_study_app/service/local_storage.dart';
import 'package:flutter_study_app/utils/http_util.dart';
import 'package:flutter_study_app/vo/result_data.dart';
import 'package:github/server.dart';
import 'package:redux/redux.dart';

class HttpService {
  static const CONTENT_TYPE_JSON = "application/json";
  static const CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";

  static IssuesService issuesService;
  static RepositorySlug slug;
  static GitHub github;

  final TokenInterceptors _tokenInterceptors = TokenInterceptors();

  HttpService() {
    github = createGitHubClient(
        auth: new Authentication.withToken(AuthConfig.githubToken));
    slug = RepositorySlug("houko", "flutter-study-app");
    issuesService = IssuesService(github);
  }

  static getClient(Authentication auth) {
    return createGitHubClient(
        auth: Authentication.withToken(AuthConfig.githubToken));
  }

  static getIssueService(Authentication auth) {
    issuesService = IssuesService(getClient(auth));
  }

  /// 获取聊天列表
  static getChatList() {
    var client = getClient(null);
    return client.issues.listByRepo(slug);
  }

  /// 获取评论列表
  getChatComments(issueNumber) {
    return issuesService.listCommentsByIssue(slug, issueNumber);
  }

  /// 添加一个评论
  addAnComment(Authentication auth, issueId, String data) {
    var client = getClient(auth);
    return client.issues.createComment(slug, issueId, data.trim());
  }

  /// 登录
  login(userName, password, store) async {
    String type = userName + ":" + password;
    var bytes = utf8.encode(type);
    var base64Str = base64.encode(bytes);
    if (AppConfig.debug) {
      print("base64Str login " + base64Str);
    }
    await LocalStorage.save(AppConfig.USER_NAME_KEY, userName);
    await LocalStorage.save(AppConfig.USER_BASIC_CODE, base64Str);

    Map requestParams = {
      "scopes": ['user', 'repo', 'gist', 'notifications'],
      "note": "admin_script",
      "client_id": AuthConfig.githubClientId,
      "client_secret": AuthConfig.githubClientSecret
    };

    var res =
        HttpUtil.get(ApiConfig.getAuthorization(), null, params: requestParams);
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

  clearAll(Store store) async {
    clearAuthorization();
    LocalStorage.remove(AppConfig.USER_INFO);
    store.dispatch(UpdateUserAction(null));
  }

  ///清除授权
  clearAuthorization() {
    _tokenInterceptors.clearAuthorization();
  }
}
