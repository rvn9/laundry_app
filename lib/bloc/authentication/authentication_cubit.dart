import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:laundry_app/utils/custom_exception.dart';

import '../../injector.dart';
import '../../repositories/authentication_repository.dart';

part 'authentication_cubit.freezed.dart';
part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final AuthRepository _authenticationRepository;

  AuthenticationCubit(this._authenticationRepository)
      : super(const AuthenticationState.initial());

  factory AuthenticationCubit.create() => AuthenticationCubit(getIt.get());

  void signIn({required String email, required String password}) async {
    emit(const AuthenticationState.loading());
    final result = await _authenticationRepository.signIn(
      email: email,
      password: password,
    );
    result.fold(
      (l) {
        emit(AuthenticationState.error(l.description));
      },
      (r) async {
        emit(const AuthenticationState.signIn());
      },
    );
  }

  void signUp({
    required String name,
    required String phone,
    required String password,
    required String email,
  }) async {
    emit(const AuthenticationState.loading());
    final result = await _authenticationRepository.signUp(
      name: name,
      phone: phone,
      email: email,
      password: password,
    );
    result.fold(
      (l) {
        emit(AuthenticationState.error(l.description));
      },
      (r) async {
        emit(const AuthenticationState.signUp());
      },
    );
  }

  void signOut() async {
    emit(const AuthenticationState.loading());
    final result = await _authenticationRepository.signOut();
    result.fold(
      (l) {
        emit(AuthenticationState.error(l.description));
      },
      (r) async {
        emit(const AuthenticationState.signOut());
      },
    );
  }
}
