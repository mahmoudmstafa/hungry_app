import 'package:fpdart/fpdart.dart';
import 'package:hungry_app/features/home_feature/domain/entities/product_entity.dart';

import '../../../../core/app_setup/app_failures.dart';
import '../entities/category_entity.dart';
import '../entities/paginated_products_entity.dart';

abstract class HomeRepo {
  Future<Either<AppFailures, PaginatedProductsEntity>> getProducts({
    required int page,
    String? categoryId,

  });
  List<ProductEntity> getCachedProducts();
  Future<Either<AppFailures, List<CategoryEntity>>> getCategories();
  Future<Either<AppFailures, List<ProductEntity>>> searchProducts({
    required String searchQuery,
  });
}
