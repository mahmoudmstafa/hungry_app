import 'package:fpdart/fpdart.dart';
import 'package:hungry_app/core/utils/use_case.dart';
import 'package:hungry_app/features/aut_feature/domain/entities/user_entity.dart';
import 'package:hungry_app/features/aut_feature/domain/use_cases/params/login_param.dart';

import '../../../../core/utils/failures.dart';
import '../repos/auth_repo.dart';

class LogoutUseCase implements NoParams {
  final AuthRepo repository;

  LogoutUseCase({required this.repository});

  Future<Either<Failure, void>> call() async {
    return await repository.logout();
  }
}
