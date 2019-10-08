import 'package:flutter_github_api/entity/basic_auth_param.dart';
import 'package:flutter_github_api/entity/index.dart';
import 'package:flutter_github_api/flutter_github_api.dart';
import 'package:flutter_study_app/config/app_config.dart';
import 'package:flutter_study_app/config/auth_config.dart';
import 'package:flutter_study_app/service/interceptors/token_interceptor.dart';
import 'package:flutter_study_app/service/local_storage.dart';

class HttpService {
  static final TokenInterceptors _tokenInterceptors = TokenInterceptors();
  static const CONTENT_TYPE_JSON = "application/json";
  static const CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";

  //本项目的仓库
  static RepositorySlug _slug = RepositorySlug("houko", "flutter-study-app");
  static Auth _auth =
      Auth(AuthConfig.githubClientId, AuthConfig.githubClientSecret);
  static GithubOauth _github0auth = GithubOauth(_auth);

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
    return github.issues.listByRepo(_slug).toList();
  }

  /// 获取评论列表
  static Future<List<IssueComment>> getChatComments(issueNumber) async {
    IssuesService issuesService = await getIssueService();
    return issuesService.listCommentsByIssue(_slug, issueNumber).toList();
  }

  /// 创建一个帖子
  static addAnIssue(String title, {String body}) async {
    GitHub github = await getGithub();
    GithubIssueRequest issueRequest = GithubIssueRequest(title, body: body);
    return github.issues.create(_slug, issueRequest);
  }

  /// 添加一个评论
  static addAnComment(issueId, String data) async {
    GitHub github = await getGithub();
    return github.issues.createComment(_slug, issueId, data.trim());
  }

  /// 登录
  static Future<OauthResult> login(String username, String password) async {
    username = username.trim();
    password = password.trim();
    return _github0auth.login(username, password);
  }
}
