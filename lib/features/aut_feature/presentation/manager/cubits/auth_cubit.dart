import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:hungry_app/features/aut_feature/domain/entities/user_entity.dart';
import 'package:hungry_app/features/aut_feature/domain/use_cases/params/login_param.dart';
import 'package:meta/meta.dart';

import '../../../domain/use_cases/login_use_case.dart';
import '../../../domain/use_cases/params/sign_up_param.dart';
import '../../../domain/use_cases/sign_up_use_case.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.signUpUseCase, required this.loginUseCase})
    : super(AuthInitial());

  final SignUpUseCase signUpUseCase;
  final LoginUseCase loginUseCase;

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    final result = await signUpUseCase.call(
      SignUpParams(
        name: name,
        email: email,
        password: password,
      ),
    );

    result.fold(
      (failure) {
        emit(
          AuthFailure(
            errMessage: failure.errMessage,
          ),
        );
      },
      (user) {
        emit(AuthSuccess(user: user));
      },
    );
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    final result = await loginUseCase.call(
      LoginParam(
        email: email,
        password: password,
      ),
    );

    result.fold(
      (failure) {
        emit(
          AuthFailure(
            errMessage: failure.errMessage,
          ),
        );
      },
      (user) {
        emit(AuthSuccess(user: user));
      },
    );
  }
}
