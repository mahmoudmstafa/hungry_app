import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:hungry_app/features/aut_feature/domain/entities/user_entity.dart';
import 'package:hungry_app/features/aut_feature/domain/use_cases/params/login_param.dart';
import 'package:meta/meta.dart';

import '../../../../../core/app_setup/app_image_picker.dart';
import '../../../domain/use_cases/auto_login_use_case.dart';
import '../../../domain/use_cases/login_use_case.dart';
import '../../../domain/use_cases/logout_use_case.dart';
import '../../../domain/use_cases/params/sign_up_param.dart';
import '../../../domain/use_cases/params/update_name_params.dart';
import '../../../domain/use_cases/sign_up_use_case.dart';
import '../../../domain/use_cases/update_nam_use_case.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required this.signUpUseCase,
    required this.loginUseCase,
    required this.logoutUseCase,
    required this.autoLoginUseCase,
    required this.updateNameUseCase,
    required this.imagePickerService,
  }) : super(AuthInitial());
  late UserEntity user;

  // use cases
  final SignUpUseCase signUpUseCase;
  final LoginUseCase loginUseCase;
  final LogoutUseCase logoutUseCase;
  final AutoLoginUseCase autoLoginUseCase;
  final UpdateNameUseCase updateNameUseCase;
  final AppImagePicker imagePickerService;

  // signUp
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
        this.user = user;
        emit(AuthSuccess(user: user));
      },
    );
  }

  // login
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
        this.user = user;
        emit(AuthSuccess(user: user));
      },
    );
  }

  // logout
  Future<void> logout() async {
    emit(AuthLoading());
    final result = await logoutUseCase.call();

    result.fold(
      (failure) {
        emit(
          AuthFailure(
            errMessage: failure.errMessage,
          ),
        );
      },
      (_) {
        emit(LogoutSuccess());
      },
    );
  }

  // auto login
  Future<void> autoLogin() async {
    emit(AuthLoading());
    final result = await autoLoginUseCase.call();

    result.fold(
      (failure) {
        emit(
          AuthFailure(
            errMessage: failure.errMessage,
          ),
        );
      },
      (user) {
        this.user = user;
        emit(AuthSuccess(user: user));
      },
    );
  }

  // pick profile image from gallery
  Future<void> pickProfileImage() async {
    log('pickProfileImage');

    final image = await imagePickerService.pickImageFromGallery();

    if (image == null) return;

    await updateNameAndPhoto(
      name: user.name,
      photo: image,
    );
  }

  // update name
  Future<void> updateNameAndPhoto({
    String? name,
    File? photo,
  }) async {

    emit(AuthLoading());

    final result = await updateNameUseCase(
      UpdateNameParams(
        name: name ?? user.name,
        photo: photo,
      ),
    );

    result.fold(
      (failure) {
        emit(
          UpdateNameFailure(
            errMessage: failure.errMessage,
          ),
        );
      },
      (user) {
        this.user = user;
        log(this.user.name);
        emit(
          UpdateNameSuccess(
            user: user,
          ),
        );
      },
    );
  }
}
