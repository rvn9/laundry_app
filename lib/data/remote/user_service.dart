import 'dart:convert';

import '../../injector.dart';
import 'base_service.dart';

class UserService {
  final BaseService _baseService;
  const UserService(this._baseService);

  factory UserService.create() => UserService(getIt.get());

  Future<Map<String, dynamic>> getUserData() async {
    final response = await _baseService.dio.get('user/info');
    final result = json.decode(response.data);
    return result['response'];
  }
}
