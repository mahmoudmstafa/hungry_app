import 'package:fpdart/fpdart.dart';
import 'package:hungry_app/core/utils/failures.dart';
import 'package:hungry_app/core/utils/use_case.dart';
import 'package:hungry_app/features/aut_feature/domain/entities/user_entity.dart';
import 'package:hungry_app/features/aut_feature/domain/repos/auth_repo.dart';
import 'package:hungry_app/features/aut_feature/domain/use_cases/params/update_user_param.dart';

class AutoLoginUseCase implements NoParams {
  final AuthRepo repository;

  AutoLoginUseCase({required this.repository});

  Future<Either<Failure, UserEntity>> call() async {
    return await repository.autoLogin();
  }
}
