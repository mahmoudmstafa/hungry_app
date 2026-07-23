import 'package:fpdart/fpdart.dart';
import 'package:hungry_app/core/app_setup/app_use_case.dart';
import 'package:hungry_app/features/aut_feature/domain/entities/user_entity.dart';
import 'package:hungry_app/features/aut_feature/domain/use_cases/params/update_name_params.dart';

import '../../../../core/app_setup/app_failures.dart';
import '../repos/auth_repo.dart';
class UpdateNameUseCase
    implements AppUseCase< UserEntity, UpdateNameParams> {
  final AuthRepo repository;

  UpdateNameUseCase({
    required this.repository,
  });

  @override
  Future<Either<AppFailures, UserEntity>> call(
      UpdateNameParams params,
      ) async {
    return await repository.updateName(
      name: params.name,
      photo: params.photo,
    );
  }
}