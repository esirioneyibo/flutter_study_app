import 'package:flutter_study_app/factory.dart';
import 'package:flutter_study_app/utils/http_util.dart';

class HttpService {
  Function successCallBack;
  Function errorCallBack;

  IHttpServiceCallback callbackObject;

  HttpService httpService;

  HttpService(this.callbackObject) {
    successCallBack = callbackObject.successCallBack;
    errorCallBack = callbackObject.errorCallBack;
  }

  getChatList() {
    HttpUtil.get(ConfigFactory.api().chatList, successCallBack, errorCallBack: errorCallBack);
  }

  getChatComments(url) {
    HttpUtil.get(url, successCallBack, errorCallBack: errorCallBack);
  }
}

class IHttpServiceCallback {
  successCallBack(response) {
    print(response);
  }

  errorCallBack(error) {
    print(error);
  }
}
