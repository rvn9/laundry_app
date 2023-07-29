import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../injector.dart';
import '../../repositories/user_repository.dart';

part 'user_cubit.freezed.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository _userRepository;

  UserCubit(this._userRepository) : super(const UserState.initial());

  factory UserCubit.create() => UserCubit(getIt.get())..getuserData();

  void getuserData() async {
    emit(const UserState.loading());
    final result = await _userRepository.getUserData();
    result.fold(
      (l) {
        emit(UserState.error(l.description));
      },
      (r) async {
        emit(UserState.success(r));
      },
    );
  }
}
