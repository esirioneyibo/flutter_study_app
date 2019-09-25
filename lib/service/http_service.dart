import 'package:flutter_study_app/factory.dart';
import 'package:github/server.dart';

class HttpService {
  Function successCallBack;
  Function errorCallBack;

  IHttpServiceCallback callbackObject;

  HttpService httpService;

  GitHub github;
  IssuesService issuesService;
  RepositorySlug slug;

  HttpService(this.callbackObject) {
    successCallBack = callbackObject.successCallBack;
    errorCallBack = callbackObject.errorCallBack;
    github = createGitHubClient(auth: new Authentication.withToken(ConfigFactory.authConfig().githubToken));
    slug = RepositorySlug("houko", "flutter-study-app");
    issuesService = IssuesService(github);
  }

  /// 获取聊天列表
  getChatList() {
    Stream<Issue> future = github.issues.listByRepo(slug);
    List<Issue> issues = [];
    future.listen((issue) {
      issues.add(issue);
    }, onDone: () {
      successCallBack(DataType.getChatList, issues);
    }, onError: ((error) {
      errorCallBack(DataType.getChatList, error);
    }));
  }

  /// 获取评论列表
  getChatComments(issueNumber) {
    Stream<IssueComment> future = issuesService.listCommentsByIssue(slug, issueNumber);
    List<IssueComment> comments;
    future.listen((comment) {
      if (comments == null) {
        comments = [];
      }
      comments.add(comment);
    }, onError: (error) {
      errorCallBack(DataType.getChatComments, error);
    }, onDone: () {
      successCallBack(DataType.getChatComments, comments);
    });
  }

  /// 添加一个评论
  addAnComment(issueId, String data) {
    Future<IssueComment> result = github.issues.createComment(slug, issueId, data.trim());
    result.then((comment) {
      successCallBack(DataType.addAnComment, comment);
    }).catchError((error) {
      errorCallBack(DataType.addAnComment, error);
    });
  }
}

class IHttpServiceCallback {
  successCallBack(DataType type, response) {
    print(response);
  }

  errorCallBack(DataType type, error) {
    print(error);
  }
}

enum DataType {
  getChatList,
  getChatComments,
  addAnComment,
  ff,
  ssd,
  dd,
  safdsa,
  safsafd,
}
