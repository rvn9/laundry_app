part of 'category_cubit.dart';

@freezed
class CategoryState with _$CategoryState {
  const factory CategoryState.initial() = _Initial;
  const factory CategoryState.success(List<dynamic> data) = _Success;
  const factory CategoryState.loading() = _Loading;
  const factory CategoryState.error(String errorMsg) = _Error;
}
