import 'dart:io';

import 'package:hungry_app/features/aut_feature/domain/entities/user_entity.dart';

import 'package:hungry_app/features/aut_feature/domain/entities/user_entity.dart';

import '../../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> signUp({
    required String name,
    required String email,
    required String password,
  });

  Future<UserModel> login({
    required String email,
    required String password,
  });

  Future<void> logout();


  Future<UserEntity> autoLogin();

  Future<UserModel> updateNameAndPhoto({
    required String name,
    File? photo,
  });
}
