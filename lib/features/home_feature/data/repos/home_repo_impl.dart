import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hungry_app/features/home_feature/domain/entities/category_entity.dart';

import '../../../../core/app_setup/app_failures.dart';
import '../../domain/entities/paginated_products_entity.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/repos/home_repo.dart';
import '../data_sources/local_data_source/local_data_source.dart';
import '../data_sources/remote_data_source/remote_data_source.dart';
import '../models/product_model.dart';

class HomeRepoImpl implements HomeRepo {
  HomeRepoImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  final ProductRemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;


  // get products
  @override
  Future<Either<AppFailures, PaginatedProductsEntity>> getProducts({
    required int page,
    String? categoryId,
  }) async {
    try {
      final products = await remoteDataSource.getProducts(
        page: page,
        categoryId: categoryId,
      );

      if (page == 1 && categoryId == null) {
        await localDataSource.cacheProducts(
          products.products.cast<ProductModel>(),
        );
      }

      return Right(products);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } on AppFailures catch (e) {
      return Left(e);
    } catch (e, stackTrace) {
      log('Unexpected Error: $e', stackTrace: stackTrace);
      return Left(
        AppFailures(
          errMessage: 'Something went wrong.\nPlease try again later.',
        ),
      );
    }
  }

  // get cached products
  @override
  List<ProductEntity> getCachedProducts() {
    return localDataSource.getCachedProducts();
  }

  // get categories
  @override
  Future<Either<AppFailures, List<CategoryEntity>>> getCategories() async {
    try {
      final categories = await remoteDataSource.getCategories();
      return Right(categories);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } on AppFailures catch (e) {
      return Left(e);
    } catch (e, stackTrace) {
      log('Unexpected Error: $e', stackTrace: stackTrace);
      return Left(
        AppFailures(
          errMessage: 'Something went wrong.\nPlease try again later.',
        ),
      );
    }
  }


  // search products
  @override
  Future<Either<AppFailures, List<ProductEntity>>> searchProducts({
    required String searchQuery,
  }) async {
    try {
      final products = await remoteDataSource.searchProducts(
        searchQuery: searchQuery,
      );
      return Right(products);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return const Right([]);
      }
      return Left(ServerFailure.fromDioError(e));
    } on AppFailures catch (e) {
      return Left(e);
    } catch (e, stackTrace) {
      log('Unexpected Error: $e', stackTrace: stackTrace);
      return Left(
        AppFailures(
          errMessage: 'Something went wrong.\nPlease try again later.',
        ),
      );
    }
  }
}
