import 'dart:convert';

import 'package:flutter_github_api/flutter_github_api.dart';
import 'package:flutter_study_app/config/api_config.dart';
import 'package:flutter_study_app/config/app_config.dart';
import 'package:flutter_study_app/config/auth_config.dart';
import 'package:flutter_study_app/service/interceptors/token_interceptor.dart';
import 'package:flutter_study_app/service/local_storage.dart';
import 'package:flutter_study_app/utils/index.dart';
import 'package:flutter_study_app/vo/result_data.dart';

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
  static Future login(String username, String password) async {
    username = username.trim();
    password = password.trim();
    String type = username + ":" + password;
    var bytes = utf8.encode(type);
    var base64Str = base64.encode(bytes);
    if (AppConfig.debug) {
      print("base64Str login " + base64Str);
    }
    var resultData;
    var auth = await isAuth();
    if (auth) {
      LocalStorage.save(AppConfig.USERNAME, username);
      LocalStorage.save(AppConfig.USER_BASIC_CODE, base64Str);
    }
    return Result(resultData, auth);
  }

  /// 判断本app是否接入了github
  static isAuth() async {
    var auth = await getAuth();
    if (auth != null && auth.result) {
      return true;
    }
    return false;
  }

  static getAuth() async {
    Map requestParams = {
      "scopes": ['user', 'repo', 'gist', 'notifications'],
      "note": "admin_script",
      "client_id": AuthConfig.githubClientId,
      "client_secret": AuthConfig.githubClientSecret
    };

    // 清除己有的权限
    httpManager.clearAuthorization();
    // 发送http请求
    return await httpManager.post(
        ApiConfig.getAuthorization(), json.encode(requestParams));
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

  ///获取用户详细信息
  static getUserInfo([username]) async {
    next() async {
      var res;
      if (username == null) {
        res = await httpManager.get(ApiConfig.getMyUserInfo());
      } else {
        res = await httpManager.get(ApiConfig.getUserInfo(username));
      }
      if (res != null && res.result) {
        User user = User.fromJson(res.data);
        if (username == null) {
          LocalStorage.save(AppConfig.USER_INFO, json.encode(user.toJson()));
        }
        return new Result(user, true);
      } else {
        return new Result(res.data, false);
      }
    }

    return await next();
  }

  ///清除授权
  static clearAuthorization() {
    _tokenInterceptors.clearAuthorization();
  }
}
