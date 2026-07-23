import 'package:fpdart/fpdart.dart';
import 'package:hungry_app/core/app_setup/app_use_case.dart';
import 'package:hungry_app/features/aut_feature/domain/entities/user_entity.dart';
import 'package:hungry_app/features/aut_feature/domain/use_cases/params/login_param.dart';

import '../../../../core/app_setup/app_failures.dart';
import '../repos/auth_repo.dart';

class LoginUseCase implements AppUseCase<UserEntity, LoginParam> {
  final AuthRepo repository;

  LoginUseCase({required this.repository});

  @override
  Future<Either<AppFailures, UserEntity>> call(LoginParam params) async {
    return await repository.login(
      email: params.email,
      password: params.password,
    );
  }
}
