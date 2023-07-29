import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'interceptors/apikey_interceptor.dart';

class BaseService {
  final Dio _dio;

  BaseService(this._dio);
  factory BaseService.create() {
    final dio = Dio(BaseOptions(
        baseUrl: 'https://belaundry-api.sebaris.link/platform/',
        connectTimeout: const Duration(milliseconds: 60000),
        receiveTimeout: const Duration(milliseconds: 60000),
        responseType: ResponseType.plain));
    if (kDebugMode) {
      dio.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          responseBody: true,
          responseHeader: true,
          requestBody: true,
          request: true,
          error: true));
      dio.interceptors.add(CurlLoggerDioInterceptor(printOnSuccess: true));
    }
    dio.interceptors.add(ApiKeyInterceptors());
    return BaseService(dio);
  }

  Dio get dio => _dio;
}
