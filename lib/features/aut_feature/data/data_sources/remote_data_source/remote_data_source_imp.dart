import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hungry_app/features/aut_feature/data/data_sources/remote_data_source/remote_data_source.dart';

import '../../../../../core/network/dio_service.dart';
import '../../../../../core/utils/secure_storage_service.dart';
import '../../models/user_model.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final DioService dioService;
  final SecureStorageService secureStorageService;

  AuthRemoteDataSourceImpl({
    required this.firebaseAuth,
    required this.dioService,
    required this.secureStorageService,
  });

  @override
  Future<UserModel> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    User? createdUser;

    try {
      final createUser = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      createdUser = createUser.user;

      if (createdUser == null) {
        throw Exception("Failed to create user");
      }

      await createdUser.updateDisplayName(name);
      await createdUser.reload();

      await dioService.dio.post(
        '/users',
        data: {
          'firebaseUid': createdUser.uid,
          'name': name,
          'email': email,
          'photo': createdUser.photoURL,
        },
      );

      final jwtResponse = await dioService.dio.post(
        '/auth/jwt',
        data: {
          'firebaseUid': createdUser.uid,
        },
      );

      final token = jwtResponse.data['token'];
      await secureStorageService.saveToken(token);

      return UserModel(
        firebaseUid: createdUser.uid,
        name: name,
        email: email,
        photo: createdUser.photoURL,
      );
    } catch (e) {
      if (createdUser != null) {
        await createdUser.delete();
      }
      rethrow;
    }
  }

  @override
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    final user = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final firebaseUser = user.user!;
    final firebaseUid = firebaseUser.uid;

    final response = await dioService.dio.post(
      '/auth/jwt',
      data: {
        'firebaseUid': firebaseUid,
      },
    );
    final token = response.data['token'];
    await secureStorageService.saveToken(token);
    final userResponse = await dioService.dio.get(
      '/users/me',
    );
    return UserModel.fromJson(userResponse.data);
  }

  @override
  Future<void> signOut() {
    throw UnimplementedError();
  }

  @override
  Future<UserModel?> getCurrentUser() {
    throw UnimplementedError();
  }

  @override
  Future<void> updateProfile({
    required String name,
    String? photo,
  }) {
    throw UnimplementedError();
  }
}
