import 'package:dio/dio.dart';
import 'package:laundry_app/data/local/secure_storage.dart';

class ApiKeyInterceptors extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final secureStorage = SecureStorge();
    final apiToken = await secureStorage.getToken();
    if (apiToken != null) {
      options.headers['Accept'] = 'application/json';
      options.headers['Content-Type'] = 'application/json';
      options.headers['token'] = apiToken;
    }
    super.onRequest(options, handler);
  }
}
