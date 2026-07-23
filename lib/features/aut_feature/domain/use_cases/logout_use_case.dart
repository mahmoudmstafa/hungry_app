import 'package:fpdart/fpdart.dart';
import 'package:hungry_app/core/app_setup/app_use_case.dart';

import '../../../../core/app_setup/app_failures.dart';
import '../repos/auth_repo.dart';

class LogoutUseCase implements NoParams {
  final AuthRepo repository;

  LogoutUseCase({required this.repository});

  Future<Either<AppFailures, void>> call() async {
    return await repository.logout();
  }
}
