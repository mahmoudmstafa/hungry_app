import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hungry_app/features/home_feature/domain/entities/category_entity.dart';

import '../../../../core/utils/failures.dart';
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

  @override
  Future<Either<Failure, PaginatedProductsEntity>> getProducts({
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
    } on Failure catch (e) {
      return Left(e);
    } catch (e, stackTrace) {
      log('Unexpected Error: $e', stackTrace: stackTrace);
      return Left(
        Failure(errMessage: 'Something went wrong.\nPlease try again later.'),
      );
    }
  }

  @override
  List<ProductEntity> getCachedProducts() {
    return localDataSource.getCachedProducts();
  }

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    try {
      final categories = await remoteDataSource.getCategories();
      return Right(categories);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } on Failure catch (e) {
      return Left(e);
    } catch (e, stackTrace) {
      log('Unexpected Error: $e', stackTrace: stackTrace);
      return Left(
        Failure(errMessage: 'Something went wrong.\nPlease try again later.'),
      );
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> searchProducts({
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
    } on Failure catch (e) {
      return Left(e);
    } catch (e, stackTrace) {
      log('Unexpected Error: $e', stackTrace: stackTrace);
      return Left(
        Failure(errMessage: 'Something went wrong.\nPlease try again later.'),
      );
    }
  }
}
