import 'package:fpdart/fpdart.dart';
import 'package:hungry_app/core/app_setup/app_failures.dart';
import 'package:hungry_app/core/app_setup/app_use_case.dart';
import 'package:hungry_app/features/aut_feature/domain/entities/user_entity.dart';
import 'package:hungry_app/features/aut_feature/domain/repos/auth_repo.dart';

class AutoLoginUseCase implements NoParams {
  final AuthRepo repository;

  AutoLoginUseCase({required this.repository});

  Future<Either<AppFailures, UserEntity>> call() async {
    return await repository.autoLogin();
  }
}
