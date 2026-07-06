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

  Future<void> signOut();

  Future<UserModel?> getCurrentUser();

  Future<void> updateProfile({
    required String name,
    String? photo,
  });
}
