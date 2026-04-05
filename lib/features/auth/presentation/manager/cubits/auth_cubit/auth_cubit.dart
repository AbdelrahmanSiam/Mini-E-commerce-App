import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:mini_ecommerce/features/auth/domain/use_cases/login_use_case/login_parameterts.dart';
import 'package:mini_ecommerce/features/auth/domain/use_cases/login_use_case/login_use_case.dart';
import 'package:mini_ecommerce/features/auth/domain/use_cases/register_use_case/register_parameters.dart';
import 'package:mini_ecommerce/features/auth/domain/use_cases/register_use_case/register_use_case.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;

  AuthCubit({required this.loginUseCase, required this.registerUseCase})
    : super(AuthInitialState());

  Future<void> login({
    required String username,
    required String password,
  }) async {
    emit(AuthLoadingState());
    final result = await loginUseCase.call(
      LoginParams(username: username, password: password),
    );
    result.fold(
      (failure) => emit(AuthFailureState(errMessage: failure.errMessage)),
      (_) => emit(AuthSuccessState()),
    );
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(AuthLoadingState());
    final result = await registerUseCase.call(
      RegisterParams(name: name, email: email, password: password),
    );
    result.fold(
      (failure) => emit(AuthFailureState(errMessage: failure.errMessage)),
      (_) => emit(AuthSuccessState()),
    );
  }
}
