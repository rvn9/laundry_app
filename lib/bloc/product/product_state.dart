part of 'product_cubit.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState.initial() = _Initial;
  const factory ProductState.success(List<Product> data) = _Success;
  const factory ProductState.loading() = _Loading;
  const factory ProductState.error(String errorMsg) = _Error;
}
