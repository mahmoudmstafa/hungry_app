import 'dart:developer' show log;
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:hungry_app/features/aut_feature/data/data_sources/remote_data_source/remote_data_source.dart';

import '../../../../../core/network/dio_service.dart';
import '../../../../../core/utils/cloudinary_service.dart';
import '../../../../../core/utils/firebase_storage_service.dart';
import '../../../../../core/utils/secure_storage_service.dart';
import '../../models/user_model.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final DioService dioService;
  final SecureStorageService secureStorageService;
  final CloudinaryService cloudinaryService;

  AuthRemoteDataSourceImpl({
    required this.firebaseAuth,
    required this.dioService,
    required this.secureStorageService, required this.cloudinaryService,
  });

  // signUp
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

  // login
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
    print(await secureStorageService.getToken());

    final userResponse = await dioService.dio.get(
      '/users/me',
    );
    return UserModel.fromJson(userResponse.data);
  }

  // logout
  @override
  Future<void> logout() async {
    await firebaseAuth.signOut();

    await secureStorageService.deleteToken();
  }

  // auto login
  @override
  Future<UserModel> autoLogin() async {
    final token = await secureStorageService.getToken();

    if (token == null) {
      throw Exception('User is not logged in ?!');
    }

    final response = await dioService.dio.get(
      '/users/me',
    );

    log('Auto Login Token: $token');
    return UserModel.fromJson(response.data);
  }

  // update name and photo
  @override
  Future<UserModel> updateNameAndPhoto({
    required String name,
    File? photo,
  }) async {

    String? photoUrl;

    if (photo != null) {
      photoUrl = await cloudinaryService.uploadProfileImage(photo);
    }

    final response = await dioService.dio.patch(
      '/users',
      data: {
        'name': name,
        if (photoUrl != null) 'photo': photoUrl,
      },
    );
    log(response.data.toString());
    return UserModel.fromJson(response.data);
  }
}
