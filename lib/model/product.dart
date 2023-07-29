import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {
  factory Product({
    required int id,
    required String name,
    required String image,
    required String sku,
    required int stock,
    required int price,
    required int active,
    required DateTime createdAt,
    DateTime? updatedAt,
    required String description,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
