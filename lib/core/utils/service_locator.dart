import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_ce/hive.dart';
import 'package:hungry_app/core/utils/secure_storage_service.dart';
import 'package:hungry_app/features/aut_feature/domain/use_cases/login_use_case.dart';
import 'package:hungry_app/features/aut_feature/domain/use_cases/update_nam_use_case.dart';
import 'package:hungry_app/features/home_feature/data/repos/home_repo_impl.dart';
import 'package:hungry_app/features/home_feature/domain/repos/home_repo.dart';
import 'package:hungry_app/features/home_feature/presentation/manager/cubits/get_category_cubit/get_category_cubit.dart';

import '../../features/aut_feature/data/data_sources/remote_data_source/remote_data_source.dart';
import '../../features/aut_feature/data/data_sources/remote_data_source/remote_data_source_imp.dart';
import '../../features/aut_feature/data/repos/auth_repo_impl.dart';
import '../../features/aut_feature/domain/repos/auth_repo.dart';
import '../../features/aut_feature/domain/use_cases/auto_login_use_case.dart';
import '../../features/aut_feature/domain/use_cases/logout_use_case.dart';
import '../../features/aut_feature/domain/use_cases/sign_up_use_case.dart';
import '../../features/aut_feature/presentation/manager/cubits/auth_cubit.dart';
import '../../features/home_feature/data/data_sources/local_data_source/local_data_source.dart';
import '../../features/home_feature/data/data_sources/local_data_source/local_data_source_impl.dart';
import '../../features/home_feature/data/data_sources/remote_data_source/remote_data_source.dart';
import '../../features/home_feature/data/data_sources/remote_data_source/remote_data_source_impl.dart';
import '../../features/home_feature/data/models/product_model.dart';
import '../../features/home_feature/domain/use_cases/get_categories_use_case.dart';
import '../../features/home_feature/domain/use_cases/get_products_use_case.dart';
import '../../features/home_feature/domain/use_cases/search_products_use_case.dart';
import '../../features/home_feature/presentation/manager/cubits/get_products_cubit/get_product_cubit.dart';
import '../../features/home_feature/presentation/manager/cubits/search_products_cubit/search_products_cubit.dart';
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
  getIt.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(
      dioService: getIt<DioService>(),
    ),
  );
  // Box
  getIt.registerLazySingleton<Box<ProductModel>>(
    () => Hive.box<ProductModel>('productsBox'),
  );

  // Local Data Source
  getIt.registerLazySingleton<LocalDataSource>(
    () => LocalDataSourceImpl(productsBox: getIt()),
  );

  // Repositories
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(
      remoteDataSource: getIt<AuthRemoteDataSource>(),
    ),
  );

  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(
      remoteDataSource: getIt<ProductRemoteDataSource>(),
      localDataSource: getIt<LocalDataSource>(),
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
  getIt.registerLazySingleton<GetProductsUseCase>(
    () => GetProductsUseCase(
      homeRepo: getIt<HomeRepo>(),
    ),
  );
  getIt.registerLazySingleton<GetCategoriesUseCase>(
    () => GetCategoriesUseCase(
      homeRepo: getIt<HomeRepo>(),
    ),
  );
  getIt.registerLazySingleton<SearchProductsUseCase>(
    () => SearchProductsUseCase(
      homeRepo: getIt<HomeRepo>(),
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
  getIt.registerFactory<GetProductCubit>(
    () => GetProductCubit(
      getProductsUseCase: getIt<GetProductsUseCase>(),
    ),
  );
  getIt.registerFactory<GetCategoryCubit>(
    () => GetCategoryCubit(
      getCategories: getIt<GetCategoriesUseCase>(),
    ),
  );
  getIt.registerFactory<SearchProductsCubit>(
    () => SearchProductsCubit(
      searchProductsUseCase: getIt<SearchProductsUseCase>(),
    ),
  );
}
