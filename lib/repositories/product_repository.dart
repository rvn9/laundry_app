import 'package:dartz/dartz.dart';

import '../data/remote/product_service.dart';
import '../injector.dart';
import '../model/product.dart';
import '../utils/custom_exception.dart';

class ProductRepository {
  final ProductService _productService;

  ProductRepository(this._productService);

  factory ProductRepository.create() => ProductRepository(getIt.get());

  Future<Either<CustomException, List<Product>>> getAllProduct() async {
    try {
      final result = await _productService.getAllProduct();
      return Right(result);
    } catch (e) {
      return Left(CustomException(description: e.toString()));
    }
  }
}
