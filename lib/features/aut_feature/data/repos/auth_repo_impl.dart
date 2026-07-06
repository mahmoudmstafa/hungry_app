import 'dart:developer' show log;

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/utils/failures.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repos/auth_repo.dart';
import '../data_sources/remote_data_source/remote_data_source.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepoImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, UserEntity>> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      UserEntity data = await remoteDataSource.signUp(
        name: name,
        email: email,
        password: password,
      );
      return right(data);
    } on DioException catch (e) {
      log('The error is --> $e');
      return left(ServerFailure.fromDioError(e));
    } on FirebaseAuthException catch (e) {
      log('The error is --> $e');

      return left(FirebaseFailure.fromSignUpException(e));
    } on Exception catch (e) {
      log('The error is --> $e');

      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> login ({
    required String email,
    required String password,
  }) async {
    try {
      UserEntity data = await remoteDataSource.login(
        email: email,
        password: password,
      );
      return right(data);
    } on DioException catch (e) {
      log('The error is --> $e');
      return left(ServerFailure.fromDioError(e));
    } on FirebaseAuthException catch (e) {
      log('The error is --> $e');

      return left(FirebaseFailure.fromSignUpException(e));
    } on Exception catch (e) {
      log('The error is --> $e');

      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<void> signOut() {
    return remoteDataSource.signOut();
  }

  @override
  Future<UserEntity?> getCurrentUser() {
    return remoteDataSource.getCurrentUser();
  }

  @override
  Future<void> updateProfile({
    required String name,
    String? photo,
  }) {
    return remoteDataSource.updateProfile(
      name: name,
      photo: photo,
    );
  }
}
