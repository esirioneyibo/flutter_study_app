import 'package:dio/dio.dart';
import 'package:flutter_study_app/service/http_service.dart';

//要查网络请求的日志可以使用过滤<net>
class HttpUtil {
  static const String GET = "get";
  static const String POST = "post";

  //get请求
  static void get(String url, DataType dataType, Function callBack,
      {Map<String, String> params, Function errorCallBack}) async {
    _request(url, dataType, callBack, method: GET, params: params, errorCallBack: errorCallBack);
  }

  //post请求
  static void post(String url, DataType dataType, Function callBack,
      {Map<String, String> params, Function errorCallBack}) async {
    _request(url, dataType, callBack, method: POST, params: params, errorCallBack: errorCallBack);
  }

  //具体的还是要看返回数据的基本结构
  //公共代码部分
  static void _request(String url, DataType dataType, Function callBack,
      {String method, Map<String, String> params, Function errorCallBack}) async {
    print("<net> url :<" + method + ">" + url);

    if (params != null && params.isNotEmpty) {
      print("<net> params :" + params.toString());
    }

    String errorMsg = "";
    int statusCode;

    try {
      Response response;
      if (method == GET) {
        //组合GET请求的参数
        if (params != null && params.isNotEmpty) {
          StringBuffer sb = new StringBuffer("?");
          params.forEach((key, value) {
            sb.write("$key" + "=" + "$value" + "&");
          });
          String paramStr = sb.toString();
          paramStr = paramStr.substring(0, paramStr.length - 1);
          url += paramStr;
        }
        response = await Dio().get(url);
      } else {
        if (params != null && params.isNotEmpty) {
          response = await Dio().post(url, data: params);
        } else {
          response = await Dio().post(url);
        }
      }

      statusCode = response.statusCode;

      //处理错误部分
      if (statusCode < 0) {
        errorMsg = "网络请求错误,状态码:" + statusCode.toString();
        _handError(errorCallBack, dataType, errorMsg);
        return;
      }

      if (callBack != null) {
        var data = response.data;
        callBack(dataType, data);
      }
    } catch (exception) {
      _handError(errorCallBack, dataType, exception.toString());
    }
  }

  //处理异常
  static void _handError(Function errorCallback, DataType dataType, String errorMsg) {
    if (errorCallback != null) {
      errorCallback(dataType, errorMsg);
    } else {
      print("<net> errorMsg :" + errorMsg);
    }
  }
}
