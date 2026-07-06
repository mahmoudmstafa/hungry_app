import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:hungry_app/core/utils/secure_storage_service.dart';
import 'package:hungry_app/features/aut_feature/domain/use_cases/login_use_case.dart';

import '../../features/aut_feature/data/data_sources/remote_data_source/remote_data_source.dart';
import '../../features/aut_feature/data/data_sources/remote_data_source/remote_data_source_imp.dart';
import '../../features/aut_feature/data/repos/auth_repo_impl.dart';
import '../../features/aut_feature/domain/repos/auth_repo.dart';
import '../../features/aut_feature/domain/use_cases/sign_up_use_case.dart';
import '../../features/aut_feature/presentation/manager/cubits/auth_cubit.dart';
import '../network/dio_service.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  // Services

  // firebase
  getIt.registerLazySingleton<FirebaseAuth>(
    () => FirebaseAuth.instance,
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

  // Cubits
  getIt.registerFactory<AuthCubit>(
    () => AuthCubit(
      loginUseCase: getIt<LoginUseCase>(),
      signUpUseCase: getIt<SignUpUseCase>(),
    ),
  );
}
