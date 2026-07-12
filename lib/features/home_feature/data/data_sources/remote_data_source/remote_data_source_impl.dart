import 'dart:developer';

import 'package:hive_ce/hive.dart';
import 'package:hungry_app/features/home_feature/data/data_sources/remote_data_source/remote_data_source.dart';
import 'package:hungry_app/features/home_feature/data/models/category_model.dart';

import '../../../../../core/network/dio_service.dart';
import '../../models/paginated_products_model.dart';
import '../../models/product_model.dart';

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  ProductRemoteDataSourceImpl({
    required this.dioService,
  });

  final DioService dioService;

  @override
  Future<PaginatedProductsModel> getProducts({
    required int page,
    int limit = 10,
    String? categoryId,
  }) async {
    final response = await dioService.dio.get(
      '/foods',
      queryParameters: {
        'page': page,
        'limit': limit,
        if (categoryId != null) 'categoryId': categoryId,
      },
    );
    log(response.data.toString());

    return PaginatedProductsModel.fromJson(response.data);
  }

  // get categories
  @override
  Future<List<CategoryModel>> getCategories() async {
    final response = await dioService.dio.get(
      '/categories',
    );
    return List<CategoryModel>.from(
      response.data.map((json) => CategoryModel.fromJson(json)),
    );
  }


  // search products
  @override
  Future<List<ProductModel>> searchProducts({
    required String searchQuery,
  }) async {
    final response = await dioService.dio.get(
      '/foods/search',
      queryParameters: {
        'name': searchQuery,
      },
    );

    return List<ProductModel>.from(
      response.data.map((json) => ProductModel.fromJson(json)),
    );
  }
}
