import 'dart:collection';
import 'dart:convert';

import '../../injector.dart';
import '../../model/product.dart';
import 'base_service.dart';

class ProductService {
  final BaseService _baseService;
  const ProductService(this._baseService);

  factory ProductService.create() => ProductService(getIt.get());

  Future<List<Product>> getAllProduct() async {
    final response = await _baseService.dio.get('product');
    final data = json.decode(response.data);
    final results = UnmodifiableListView(data['response']);
    final parsed = results.map((e) => Product.fromJson(e)).toList();
    return parsed;
  }
}
