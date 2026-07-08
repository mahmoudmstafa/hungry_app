import 'dart:io';

import '../../../../core/utils/failures.dart';
import '../entities/user_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> signUp({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure, UserEntity>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserEntity>> autoLogin();

  Future<Either<Failure, void>> logout();

  Future<Either<Failure, UserEntity>> updateName({
    required String name,
    required File? photo,
  });
}
