import 'package:fpdart/fpdart.dart';
import 'package:hungry_app/features/aut_feature/domain/entities/user_entity.dart';
import 'package:hungry_app/features/aut_feature/domain/use_cases/params/sign_up_param.dart';

import '../../../../core/utils/failures.dart';
import '../../../../core/utils/use_case.dart';
import '../repos/auth_repo.dart';
 class SignUpUseCase implements UseCase<UserEntity, SignUpParams> {
  final AuthRepo repository;

  SignUpUseCase({required this.repository});

  @override
  Future<Either<Failure, UserEntity>> call(SignUpParams params) async {
    return await repository.signUp(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

