part of 'user_cubit.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.initial() = _Initial;
  const factory UserState.success(Map<String, dynamic> data) = _Success;
  const factory UserState.loading() = _Loading;
  const factory UserState.error(String errorMsg) = _Error;
}
