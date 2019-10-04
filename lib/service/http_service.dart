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

  //本项目的仓库
  static RepositorySlug slug = RepositorySlug("houko", "flutter-study-app");

  static Future<GitHub> getGithub() async {
    String username = await LocalStorage.get(Constant.USERNAME);
    String password = await LocalStorage.get(Constant.PASSWORD);
    if (username == null || password == null) {
      return createGitHubClient();
    }
    return createGitHubClient(auth: Authentication.basic(username, password));
  }

  static Future<IssuesService> getIssueService() async {
    GitHub github = await getGithub();
    return IssuesService(github);
  }

  /// 获取聊天列表
  static Future<List<Issue>> getChatList() async {
    GitHub github = await getGithub();
    return github.issues.listByRepo(slug).toList();
  }

  /// 获取评论列表
  static Future<List<IssueComment>> getChatComments(issueNumber) async {
    IssuesService issuesService = await getIssueService();
    return issuesService.listCommentsByIssue(slug, issueNumber).toList();
  }

  /// 添加一个评论
  static addAnComment(issueId, String data) async {
    GitHub github = await getGithub();
    return github.issues.createComment(slug, issueId, data.trim());
  }

  /// 登录
  static Future login(String username, String password) async {
    username = username.trim();
    password = password.trim();

    LocalStorage.save(Constant.USERNAME, username);
    LocalStorage.save(Constant.PASSWORD, password);
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
    var userText = await LocalStorage.get(Constant.USER_INFO);
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
          LocalStorage.save(Constant.USER_INFO, json.encode(user.toJson()));
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
