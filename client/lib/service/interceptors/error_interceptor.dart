import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter_study_app/vo/result_data.dart';

///是否需要弹提示
const NOT_TIP_KEY = "noTip";

class ErrorInterceptors extends InterceptorsWrapper {
  final Dio _dio;

  ErrorInterceptors(this._dio);

  @override
  onRequest(RequestOptions options) async {
    //没有网络
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return _dio.resolve(ResultData(
          Code.errorHandleFunction(Code.NETWORK_ERROR, "", false),
          false,
          Code.NETWORK_ERROR));
    }
    return options;
  }
}
