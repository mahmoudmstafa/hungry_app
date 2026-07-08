import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:hungry_app/core/utils/secure_storage_service.dart';
import 'package:hungry_app/features/aut_feature/domain/use_cases/login_use_case.dart';
import 'package:hungry_app/features/aut_feature/domain/use_cases/update_nam_use_case.dart';

import '../../features/aut_feature/data/data_sources/remote_data_source/remote_data_source.dart';
import '../../features/aut_feature/data/data_sources/remote_data_source/remote_data_source_imp.dart';
import '../../features/aut_feature/data/repos/auth_repo_impl.dart';
import '../../features/aut_feature/domain/repos/auth_repo.dart';
import '../../features/aut_feature/domain/use_cases/auto_login_use_case.dart';
import '../../features/aut_feature/domain/use_cases/logout_use_case.dart';
import '../../features/aut_feature/domain/use_cases/sign_up_use_case.dart';
import '../../features/aut_feature/presentation/manager/cubits/auth_cubit.dart';
import '../network/dio_service.dart';
import 'cloudinary_service.dart';
import 'firebase_storage_service.dart';
import 'image_picker_service.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  // Services

  // image packer
  getIt.registerLazySingleton<ImagePickerService>(
    () => ImagePickerService(),
  );
  // firebase
  getIt.registerLazySingleton<FirebaseAuth>(
    () => FirebaseAuth.instance,
  );
  getIt.registerLazySingleton<CloudinaryService>(
    () => CloudinaryService(),
  );
  // source storage service
  getIt.registerLazySingleton<SecureStorageService>(
    () => SecureStorageService(),
  );
  // dio service
  getIt.registerLazySingleton<DioService>(
    () => DioService(
      secureStorageService: getIt<SecureStorageService>(),
    ),
  );

  // Data Sources
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      firebaseAuth: getIt<FirebaseAuth>(),
      secureStorageService: getIt<SecureStorageService>(),
      dioService: getIt<DioService>(),
      cloudinaryService: getIt<CloudinaryService>(),
    ),
  );

  // Repositories
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(
      remoteDataSource: getIt<AuthRemoteDataSource>(),
    ),
  );

  // Use Cases
  getIt.registerLazySingleton<SignUpUseCase>(
    () => SignUpUseCase(
      repository: getIt<AuthRepo>(),
    ),
  );

  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(
      repository: getIt<AuthRepo>(),
    ),
  );

  getIt.registerLazySingleton<LogoutUseCase>(
    () => LogoutUseCase(
      repository: getIt<AuthRepo>(),
    ),
  );
  getIt.registerLazySingleton<AutoLoginUseCase>(
    () => AutoLoginUseCase(
      repository: getIt<AuthRepo>(),
    ),
  );
  getIt.registerLazySingleton<UpdateNameUseCase>(
    () => UpdateNameUseCase(
      repository: getIt<AuthRepo>(),
    ),
  );

  // Cubits
  getIt.registerLazySingleton<AuthCubit>(
    () => AuthCubit(
      autoLoginUseCase: getIt<AutoLoginUseCase>(),
      logoutUseCase: getIt<LogoutUseCase>(),
      loginUseCase: getIt<LoginUseCase>(),
      signUpUseCase: getIt<SignUpUseCase>(),
      updateNameUseCase: getIt<UpdateNameUseCase>(),
      imagePickerService: getIt<ImagePickerService>(),
    ),
  );
}
