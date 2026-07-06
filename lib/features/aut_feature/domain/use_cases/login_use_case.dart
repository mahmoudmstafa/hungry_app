import 'package:fpdart/fpdart.dart';
import 'package:hungry_app/core/utils/use_case.dart';
import 'package:hungry_app/features/aut_feature/domain/entities/user_entity.dart';
import 'package:hungry_app/features/aut_feature/domain/use_cases/params/login_param.dart';

import '../../../../core/utils/failures.dart';
import '../repos/auth_repo.dart';

class LoginUseCase implements UseCase<UserEntity, LoginParam> {
  final AuthRepo repository;

  LoginUseCase({required this.repository});

  @override
  Future<Either<Failure, UserEntity>> call(LoginParam params) async {
    return await repository.login(
      email: params.email,
      password: params.password,
    );
  }
}
