import 'dart:developer' show log;
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/utils/cloudinary_service.dart';
import '../../../../core/utils/failures.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repos/auth_repo.dart';
import '../data_sources/remote_data_source/remote_data_source.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource remoteDataSource;
  AuthRepoImpl({required this.remoteDataSource});

  // signUp
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

  // login
  @override
  Future<Either<Failure, UserEntity>> login({
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

  // logout
  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await remoteDataSource.logout();
      return const Right(null);
    } catch (e) {
      return Left(
        Failure(
          errMessage: e.toString(),
        ),
      );
    }
  }

  // auto login
  @override
  Future<Either<Failure, UserEntity>> autoLogin() async {
    try {
      UserEntity user = await remoteDataSource.autoLogin();
      return Right(
        user,
      );
    } on DioException catch (e) {
      return Left(
        ServerFailure.fromDioError(e),
      );
    } on FirebaseAuthException catch (e) {
      return Left(
        FirebaseFailure.fromAutoLoginException(e),
      );
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      log('the error is --> $e');
      return Left(
        Failure(
          errMessage: e.toString(),
        ),
      );
    }
  }

  // update name and photo and photo
  @override
  Future<Either<Failure, UserEntity>> updateName({
    required String name,
    required File? photo,
  }) async {
    try {
      final user = await remoteDataSource.updateNameAndPhoto(
        photo: photo,
        name: name,
      );

      return Right(user);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(
        Failure(
          errMessage: e.toString(),
        ),
      );
    }
  }
}
