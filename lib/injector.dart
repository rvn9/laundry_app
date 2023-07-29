import 'package:get_it/get_it.dart';
import 'package:laundry_app/data/remote/category_service.dart';
import 'package:laundry_app/data/remote/product_service.dart';
import 'package:laundry_app/data/remote/user_service.dart';
import 'package:laundry_app/repositories/category_repository.dart';
import 'package:laundry_app/repositories/product_repository.dart';
import 'package:laundry_app/repositories/user_repository.dart';

import 'data/local/secure_storage.dart';
import 'data/remote/auth_service.dart';
import 'data/remote/base_service.dart';
import 'repositories/authentication_repository.dart';

final getIt = GetIt.instance;

class Injector {
  const Injector();

  static Future<void> initialize() async {
    const injector = Injector();
    injector._initializeService();
    injector._initializeRepository();
  }

  void _initializeService() {
    getIt.registerLazySingleton<BaseService>(() => BaseService.create());
    getIt.registerLazySingleton<AuthService>(() => AuthService.create());
    getIt.registerLazySingleton<ProductService>(() => ProductService.create());
    getIt.registerLazySingleton<UserService>(() => UserService.create());
    getIt
        .registerLazySingleton<CategoryService>(() => CategoryService.create());
    getIt.registerLazySingleton<SecureStorge>(() => SecureStorge.create());
  }

  void _initializeRepository() {
    getIt.registerLazySingleton<UserRepository>(() => UserRepository.create());
    getIt.registerLazySingleton<ProductRepository>(
        () => ProductRepository.create());
    getIt.registerLazySingleton<AuthRepository>(() => AuthRepository.create());
    getIt.registerLazySingleton<CategoryRepository>(
        () => CategoryRepository.create());
  }
}
