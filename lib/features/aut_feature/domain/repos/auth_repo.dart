import 'dart:io';

import '../../../../core/app_setup/app_failures.dart';
import '../entities/user_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract class AuthRepo {
  Future<Either<AppFailures, UserEntity>> signUp({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<AppFailures, UserEntity>> login({
    required String email,
    required String password,
  });

  Future<Either<AppFailures, UserEntity>> autoLogin();

  Future<Either<AppFailures, void>> logout();

  Future<Either<AppFailures, UserEntity>> updateName({
    required String name,
    required File? photo,
  });
}
