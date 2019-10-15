import 'package:flutter/cupertino.dart';
import 'package:flutter_github_api/entity/basic_auth_param.dart';
import 'package:flutter_github_api/entity/index.dart';
import 'package:flutter_github_api/flutter_github_api.dart';
import 'package:flutter_study_app/config/app_config.dart';
import 'package:flutter_study_app/config/auth_config.dart';
import 'package:flutter_study_app/model/app_model.dart';
import 'package:flutter_study_app/service/interceptors/token_interceptor.dart';
import 'package:flutter_study_app/service/local_storage.dart';
import 'package:flutter_study_app/utils/index.dart';

class HttpService {
  static final TokenInterceptors _tokenInterceptors = TokenInterceptors();
  static const CONTENT_TYPE_JSON = "application/json";
  static const CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";

  //本项目的仓库
  static RepositorySlug _slug =
      RepositorySlug("flutter-jp", "flutter_study_app");
  static Auth _auth =
      Auth(AuthConfig.githubClientId, AuthConfig.githubClientSecret);
  static GithubOauth _github0auth = GithubOauth(_auth);

  /// get github
  static Future<GitHub> getGithub(BuildContext context) async {
    String username = await LocalStorage.get(Constant.USERNAME);
    String password = await LocalStorage.get(Constant.PASSWORD);
    if (username == null || password == null) {
      return createGitHubClient();
    }
    return createGitHubClient(auth: Authentication.basic(username, password));
  }

  /// 获取聊天列表
  static Future<List<Issue>> getChatList(BuildContext context) async {
    GitHub github = await getGithub(context);
    return github.issues.listByRepo(_slug).toList();
  }

  /// 获取评论列表
  static Future<List<IssueComment>> getChatComments(
      BuildContext context, issueNumber) async {
    GitHub github = await getGithub(context);
    IssuesService issuesService = IssuesService(github);
    return issuesService.listCommentsByIssue(_slug, issueNumber).toList();
  }

  /// 创建一个帖子
  static Future<Issue> addAnIssue(BuildContext context, String title,
      {String body}) async {
    GitHub github = await getGithub(context);
    IssueRequest issueRequest = IssueRequest();
    issueRequest.title = title;
    issueRequest.body = body;
    return github.issues.create(_slug, issueRequest);
  }

  /// 添加一个评论
  static Future<IssueComment> addAnComment(
      BuildContext context, issueId, String data) async {
    GitHub github = await getGithub(context);
    return github.issues.createComment(_slug, issueId, data.trim());
  }

  /// close issue
  static closeIssue(BuildContext context, Issue issue) async {
    GitHub github = await getGithub(context);
    IssueRequest request = IssueRequest();
    request.state = 'closed';
    NavigatorUtil.back(context);
    github.issues.edit(_slug, issue.number, request);
  }

  /// 登录
  static Future<OauthResult> login(String username, String password) async {
    username = username.trim();
    password = password.trim();
    return _github0auth.login(username, password);
  }

  /// 是否有权删issue
  static Future<bool> isRespAdmin(BuildContext context) async {
    AppModel model = CommonUtil.getModel(context);
    GitHub github = await getGithub(context);
    if (model.user == null) {
      return false;
    }
    return github.repositories.isCollaborator(_slug, model.user.login);
  }
}
