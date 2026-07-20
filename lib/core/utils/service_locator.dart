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
import '../../features/cart_feature/data/data_sources/local_data_source/local_data_source.dart';
import '../../features/cart_feature/data/data_sources/local_data_source/local_data_source_impl.dart';
import '../../features/cart_feature/data/models/cart_item_model.dart';
import '../../features/cart_feature/data/repos/cart_repo_impl.dart';
import '../../features/cart_feature/domain/repos/cart_repo.dart';
import '../../features/cart_feature/domain/use_cases/add_to_cart_use_case.dart';
import '../../features/cart_feature/domain/use_cases/clear_cart_item_use_case.dart';
import '../../features/cart_feature/domain/use_cases/get_cart_items_use_case.dart';
import '../../features/cart_feature/domain/use_cases/remove_cart_item_use_case.dart';
import '../../features/cart_feature/domain/use_cases/updata_cart_item_use_case.dart';
import '../../features/cart_feature/presentation/manager/cubits/cart_cubit/cart_cubit.dart';
import '../../features/checkout_and_order_history_feature/data/data_sources/local_data_source/checkout_local_data_source.dart';
import '../../features/checkout_and_order_history_feature/data/data_sources/local_data_source/checkout_local_data_source_impl.dart';
import '../../features/checkout_and_order_history_feature/data/models/order_model.dart';
import '../../features/checkout_and_order_history_feature/data/repos/checkout_repo_impl.dart';
import '../../features/checkout_and_order_history_feature/domain/repos/checkout_repo.dart';
import '../../features/checkout_and_order_history_feature/domain/use_cases/get_orders_use_case.dart';
import '../../features/checkout_and_order_history_feature/domain/use_cases/place_order_use_case.dart';
import '../../features/checkout_and_order_history_feature/presentation/manger/cubits/checkout_cubit.dart';
import '../../features/favourite_feature/data/data_sources/remote_data_source/local_data_source.dart';
import '../../features/favourite_feature/data/data_sources/remote_data_source/local_data_source_imp.dart';
import '../../features/favourite_feature/data/models/favorite_model.dart';
import '../../features/favourite_feature/data/repos/favorite_repo_impl.dart';
import '../../features/favourite_feature/domain/repos/favorite_repo.dart';
import '../../features/favourite_feature/domain/use_cases/add_favorite_use_case.dart';
import '../../features/favourite_feature/domain/use_cases/get_favorite_use_case.dart';
import '../../features/favourite_feature/domain/use_cases/is_favorite_use_case.dart';
import '../../features/favourite_feature/domain/use_cases/remove_favorite_use_case.dart';
import '../../features/favourite_feature/presentation/manager/cubits/favorite_cubit/favorite_cubit.dart';
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
import '../../features/product_details_feature/data/data_sources/remote_data_source/remote_data_source.dart';
import '../../features/product_details_feature/data/data_sources/remote_data_source/remote_data_source_impl.dart';
import '../../features/product_details_feature/data/repos/side_options_and_toppings_repo_repo_impl.dart';
import '../../features/product_details_feature/domain/repos/side_options_and_toppings_repo_repo.dart';
import '../../features/product_details_feature/domain/use_cases/get_side_options_use_case.dart';
import '../../features/product_details_feature/domain/use_cases/get_toppings_use_case.dart';
import '../../features/product_details_feature/presentation/manger/cubits/ total_product_price_and_toppings_and_side_options/_total_product_price_and_toppings_and_side_options_cubit.dart';
import '../../features/product_details_feature/presentation/manger/cubits/get_side_options_cubit/get_side_options_cubit.dart';
import '../../features/product_details_feature/presentation/manger/cubits/get_toppings_cubit/get_toppings_cubit.dart';
import '../network/dio_service.dart';
import 'cloudinary_service.dart';
import 'constant.dart';
import 'image_picker_service.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  //=========================//
  // Services
  //=========================//

  getIt.registerLazySingleton<ImagePickerService>(
    () => ImagePickerService(),
  );

  getIt.registerLazySingleton<FirebaseAuth>(
    () => FirebaseAuth.instance,
  );

  getIt.registerLazySingleton<CloudinaryService>(
    () => CloudinaryService(),
  );

  getIt.registerLazySingleton<SecureStorageService>(
    () => SecureStorageService(),
  );

  getIt.registerLazySingleton<DioService>(
    () => DioService(
      secureStorageService: getIt<SecureStorageService>(),
    ),
  );

  //=========================//
  // Hive Boxes
  //=========================//

  getIt.registerLazySingleton<Box<ProductModel>>(
    () => Hive.box<ProductModel>(productBox),
  );

  getIt.registerLazySingleton<Box<CartItemModel>>(
    () => Hive.box<CartItemModel>(cartBox),
  );
  getIt.registerLazySingleton<Box<FavouriteModel>>(
    () => Hive.box<FavouriteModel>(favoriteBox),
  );

  getIt.registerLazySingleton<Box<OrderModel>>(
    () => Hive.box<OrderModel>(ordersBox),
  );
  //=========================//
  // Data Sources
  //=========================//

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

  getIt.registerLazySingleton<ToppingRemoteDataSource>(
    () => ToppingRemoteDataSourceImpl(
      dioService: getIt<DioService>(),
    ),
  );

  getIt.registerLazySingleton<LocalDataSource>(
    () => LocalDataSourceImpl(
      productsBox: getIt(),
    ),
  );

  getIt.registerLazySingleton<CartLocalDataSource>(
    () => CartLocalDataSourceImpl(
      cartBox: getIt<Box<CartItemModel>>(),
    ),
  );
  getIt.registerLazySingleton<FavouriteLocalDataSource>(
    () => FavouriteLocalDataSourceImpl(
      favouriteBox: getIt(),
    ),
  );
  getIt.registerLazySingleton<CheckoutLocalDataSource>(
    () => CheckoutLocalDataSourceImpl(
      ordersBox: getIt<Box<OrderModel>>(),
      cartBox: getIt<Box<CartItemModel>>(),
    ),
  );

  //=========================//
  // Repositories
  //=========================//

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

  getIt.registerLazySingleton<SideOptionsAndToppingsRepo>(
    () => SideOptionsAndToppingsRepoRepoImpl(
      remoteDataSource: getIt<ToppingRemoteDataSource>(),
    ),
  );

  getIt.registerLazySingleton<CartRepo>(
    () => CartRepoImpl(
      localDataSource: getIt<CartLocalDataSource>(),
    ),
  );
  getIt.registerLazySingleton<FavouriteRepository>(
    () => FavouriteRepositoryImpl(
      localDataSource: getIt<FavouriteLocalDataSource>(),
    ),
  );

  getIt.registerLazySingleton<CheckoutRepo>(
    () => CheckoutRepoImpl(
      localDataSource: getIt<CheckoutLocalDataSource>(),
    ),
  );

  //=========================//
  // UseCases
  //=========================//

  getIt.registerLazySingleton(
    () => SignUpUseCase(
      repository: getIt<AuthRepo>(),
    ),
  );

  getIt.registerLazySingleton(
    () => LoginUseCase(
      repository: getIt<AuthRepo>(),
    ),
  );

  getIt.registerLazySingleton(
    () => LogoutUseCase(
      repository: getIt<AuthRepo>(),
    ),
  );

  getIt.registerLazySingleton(
    () => AutoLoginUseCase(
      repository: getIt<AuthRepo>(),
    ),
  );

  getIt.registerLazySingleton(
    () => UpdateNameUseCase(
      repository: getIt<AuthRepo>(),
    ),
  );

  getIt.registerLazySingleton(
    () => GetProductsUseCase(
      homeRepo: getIt<HomeRepo>(),
    ),
  );

  getIt.registerLazySingleton(
    () => GetCategoriesUseCase(
      homeRepo: getIt<HomeRepo>(),
    ),
  );

  getIt.registerLazySingleton(
    () => SearchProductsUseCase(
      homeRepo: getIt<HomeRepo>(),
    ),
  );

  getIt.registerLazySingleton(
    () => GetToppingsUseCase(
      repo: getIt<SideOptionsAndToppingsRepo>(),
    ),
  );

  getIt.registerLazySingleton(
    () => GetSideOptionsUseCase(
      repo: getIt<SideOptionsAndToppingsRepo>(),
    ),
  );

  getIt.registerLazySingleton(
    () => AddToCartUseCase(
      repo: getIt<CartRepo>(),
    ),
  );

  getIt.registerLazySingleton(
    () => GetCartItemsUseCase(
      repo: getIt<CartRepo>(),
    ),
  );

  getIt.registerLazySingleton(
    () => RemoveCartItemUseCase(
      repo: getIt<CartRepo>(),
    ),
  );

  getIt.registerLazySingleton(
    () => ClearCartUseCase(
      repo: getIt<CartRepo>(),
    ),
  );

  getIt.registerLazySingleton<UpdateCartItemUseCase>(
    () => UpdateCartItemUseCase(
      repo: getIt<CartRepo>(),
    ),
  );
  getIt.registerLazySingleton<AddFavouriteUseCase>(
    () => AddFavouriteUseCase(
      getIt<FavouriteRepository>(),
    ),
  );
  getIt.registerLazySingleton<RemoveFavouriteUseCase>(
    () => RemoveFavouriteUseCase(
      getIt<FavouriteRepository>(),
    ),
  );
  getIt.registerLazySingleton<GetFavouriteUseCase>(
    () => GetFavouriteUseCase(
      getIt<FavouriteRepository>(),
    ),
  );
  getIt.registerLazySingleton<IsFavouriteUseCase>(
    () => IsFavouriteUseCase(
      getIt<FavouriteRepository>(),
    ),
  );
  getIt.registerLazySingleton<PlaceOrderUseCase>(
    () => PlaceOrderUseCase(
      getIt<CheckoutRepo>(),
    ),
  );
  getIt.registerLazySingleton<GetOrdersUseCase>(
    () => GetOrdersUseCase(
      getIt<CheckoutRepo>(),
    ),
  );


  //=========================//
  // Cubits
  //=========================//

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

  getIt.registerFactory(
    () => GetProductCubit(
      getProductsUseCase: getIt<GetProductsUseCase>(),
    ),
  );

  getIt.registerFactory(
    () => GetCategoryCubit(
      getCategories: getIt<GetCategoriesUseCase>(),
    ),
  );

  getIt.registerFactory(
    () => SearchProductsCubit(
      searchProductsUseCase: getIt<SearchProductsUseCase>(),
    ),
  );

  getIt.registerFactory(
    () => GetToppingsCubit(
      getToppingsUseCase: getIt<GetToppingsUseCase>(),
    ),
  );

  getIt.registerFactory(
    () => GetSideOptionsCubit(
      getSideOptionsUseCase: getIt<GetSideOptionsUseCase>(),
    ),
  );

  getIt.registerFactory(
    () => CartCubit(
      updateCartItemUseCase: getIt<UpdateCartItemUseCase>(),
      firebaseAuth: getIt<FirebaseAuth>(),
      addToCartUseCase: getIt<AddToCartUseCase>(),
      getCartItemsUseCase: getIt<GetCartItemsUseCase>(),
      removeCartItemUseCase: getIt<RemoveCartItemUseCase>(),
      clearCartUseCase: getIt<ClearCartUseCase>(),
    ),
  );
  getIt.registerFactory(
    () => FavoriteCubit(
      firebaseAuth: getIt<FirebaseAuth>(),
      addFavouriteUseCase: getIt<AddFavouriteUseCase>(),
      removeFavouriteUseCase: getIt<RemoveFavouriteUseCase>(),
      getFavouriteUseCase: getIt<GetFavouriteUseCase>(),
      isFavouriteUseCase: getIt<IsFavouriteUseCase>(),
    ),
  );

  getIt.registerFactory(
    () => TotalProductPriceAndToppingsAndSideOptionsCubit(
      productPrice: 0,
    ),
  );
  getIt.registerFactory(
    () => CheckoutCubit(
      placeOrderUseCase: getIt<PlaceOrderUseCase>(),
      getOrdersUseCase: getIt<GetOrdersUseCase>(),
      clearCartUseCase: getIt<ClearCartUseCase>(),
      firebaseAuth: getIt<FirebaseAuth>(),
    ),
  );
}
