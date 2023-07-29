import 'package:dartz/dartz.dart';
import 'package:laundry_app/utils/custom_exception.dart';

import '../data/local/secure_storage.dart';
import '../data/remote/auth_service.dart';
import '../injector.dart';

class AuthRepository {
  final AuthService _authService;
  final SecureStorge _secureStorge;

  AuthRepository(this._authService, this._secureStorge);

  factory AuthRepository.create() => AuthRepository(getIt.get(), getIt.get());

  Future<Either<CustomException, bool>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _authService.signIn(
        email,
        password,
      );
      if (result['status'] == false) {
        return Left(CustomException(description: result['message']));
      } else {
        final token = result['response'];
        if (token != null) {
          _secureStorge.setToken(token);
        }
        return const Right(true);
      }
    } catch (e) {
      return Left(CustomException(description: e.toString()));
    }
  }

  Future<Either<CustomException, bool>> signUp({
    required String name,
    required String phone,
    required String password,
    required String email,
  }) async {
    try {
      final result = await _authService.signUp(
        name: name,
        phone: phone,
        email: email,
        password: password,
      );

      return Right(result);
    } catch (e) {
      return Left(CustomException(description: e.toString()));
    }
  }

  Future<Either<CustomException, bool>> signOut() async {
    try {
      await _secureStorge.clearToken();
      return const Right(true);
    } catch (e) {
      return Left(CustomException(description: e.toString()));
    }
  }
}
