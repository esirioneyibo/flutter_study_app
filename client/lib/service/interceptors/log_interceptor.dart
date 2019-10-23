import 'package:dio/dio.dart';
import 'package:flutter_study_app/config/app_config.dart';

class LogsInterceptors extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options) async {
    if (Constant.debug) {
      print("请求url：${options.path}");
      print('请求头: ' + options.headers.toString());
      if (options.data != null) {
        print('请求参数: ' + options.data.toString());
      }
    }
    return options;
  }

  @override
  onResponse(Response response) async {
    if (Constant.debug) {
      if (response != null) {
        print('返回参数: ' + response.toString());
      }
    }
    return response; // continue
  }

  @override
  onError(DioError err) async {
    if (Constant.debug) {
      print('请求异常: ' + err.toString());
      print('请求异常信息: ' + err.response?.toString() ?? "");
    }
    return err;
  }
}
