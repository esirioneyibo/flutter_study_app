import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:flutter_study_app/service/interceptors/error_interceptor.dart';
import 'package:flutter_study_app/service/interceptors/header_interceptor.dart';
import 'package:flutter_study_app/service/interceptors/log_interceptor.dart';
import 'package:flutter_study_app/service/interceptors/response_interceptor.dart';
import 'package:flutter_study_app/service/interceptors/token_interceptor.dart';
import 'package:flutter_study_app/vo/result_data.dart';

///http请求 异步处理
class HttpManager {
  static const CONTENT_TYPE_JSON = "application/json";
  static const CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";

  Dio _dio = Dio(); // 使用默认配置

  final TokenInterceptors _tokenInterceptors = TokenInterceptors();

  HttpManager() {
    _dio.interceptors.add(HeaderInterceptors());

    _dio.interceptors.add(_tokenInterceptors);

    _dio.interceptors.add(LogsInterceptors());

    _dio.interceptors.add(ErrorInterceptors(_dio));

    _dio.interceptors.add(ResponseInterceptors());
  }

  get(url, {params, Map<String, dynamic> header}) {
    return netFetch(url, params, header, Options(method: 'GET'));
  }

  Future post(url, params, {Map<String, dynamic> header}) {
    return netFetch(url, params, header, Options(method: 'GET'));
  }

  ///发起网络请求
  ///[ url] 请求url
  ///[ params] 请求参数
  ///[ header] 外加头
  ///[ option] 配置
  netFetch(url, params, Map<String, dynamic> header, Options option,
      {noTip = false}) async {
    Map<String, dynamic> headers = HashMap();
    if (header != null) {
      headers.addAll(header);
    }

    if (option != null) {
      option.headers = headers;
    } else {
      option = Options(method: "get");
      option.headers = headers;
    }

    resultError(DioError e) {
      Response errorResponse;
      if (e.response != null) {
        errorResponse = e.response;
      } else {
        errorResponse = Response(statusCode: 666);
      }
      if (e.type == DioErrorType.CONNECT_TIMEOUT ||
          e.type == DioErrorType.RECEIVE_TIMEOUT) {
        errorResponse.statusCode = Code.NETWORK_TIMEOUT;
      }
      return ResultData(
          Code.errorHandleFunction(errorResponse.statusCode, e.message, noTip),
          false,
          errorResponse.statusCode);
    }

    Response response;
    try {
      response = await _dio.request(url, data: params, options: option);
    } on DioError catch (e) {
      return resultError(e);
    }
    if (response.data is DioError) {
      return resultError(response.data);
    }
    return response.data;
  }

  ///清除授权
  clearAuthorization() {
    _tokenInterceptors.clearAuthorization();
  }

  ///获取授权token
  getAuthorization() async {
    return _tokenInterceptors.getAuthorization();
  }
}

final HttpManager httpManager = HttpManager();
