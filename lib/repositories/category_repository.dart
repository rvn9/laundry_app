import 'package:dartz/dartz.dart';

import '../data/remote/category_service.dart';
import '../injector.dart';
import '../utils/custom_exception.dart';

class CategoryRepository {
  final CategoryService _categoryService;

  CategoryRepository(this._categoryService);

  factory CategoryRepository.create() => CategoryRepository(getIt.get());

  Future<Either<CustomException, List<dynamic>>> getAllCategory() async {
    try {
      final result = await _categoryService.getAllCategory();
      return Right(result);
    } catch (e) {
      return Left(CustomException(description: e.toString()));
    }
  }
}
