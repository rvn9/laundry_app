import 'dart:convert';

import '../../injector.dart';
import 'base_service.dart';

class AuthService {
  final BaseService _baseService;
  const AuthService(this._baseService);

  factory AuthService.create() => AuthService(getIt.get());

  Future<bool> signUp({
    required String name,
    required String phone,
    required String password,
    required String email,
  }) async {
    final response = await _baseService.dio.post('user/sign-up', data: {
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
    });
    if (response.statusCode == 200) return true;
    return false;
  }

  Future<Map<String, dynamic>> signIn(String email, String password) async {
    final response = await _baseService.dio.post('user/sign-in', data: {
      'email': email,
      'password': password,
    });
    final Map<String, dynamic> result = json.decode(response.data);
    return result;
  }
}
