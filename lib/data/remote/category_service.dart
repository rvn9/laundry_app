import 'dart:convert';

import '../../injector.dart';
import 'base_service.dart';

class CategoryService {
  final BaseService _baseService;
  const CategoryService(this._baseService);

  factory CategoryService.create() => CategoryService(getIt.get());

  Future<List<dynamic>> getAllCategory() async {
    final response = await _baseService.dio.get('product/categories');
    final result = json.decode(response.data);
    return result['response'];
  }
}
