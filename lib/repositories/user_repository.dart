import 'package:dartz/dartz.dart';

import '../data/remote/user_service.dart';
import '../injector.dart';
import '../utils/custom_exception.dart';

class UserRepository {
  final UserService _userService;

  UserRepository(this._userService);

  factory UserRepository.create() => UserRepository(getIt.get());

  Future<Either<CustomException, Map<String, dynamic>>> getUserData() async {
    try {
      final result = await _userService.getUserData();
      return Right(result);
    } catch (e) {
      return Left(CustomException(description: e.toString()));
    }
  }
}
