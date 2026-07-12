import 'package:fpdart/fpdart.dart';
import 'package:hungry_app/features/home_feature/domain/entities/product_entity.dart';

import '../../../../core/utils/failures.dart';
import '../entities/category_entity.dart';
import '../entities/paginated_products_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, PaginatedProductsEntity>> getProducts({
    required int page,
    String? categoryId,

  });
  List<ProductEntity> getCachedProducts();
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
  Future<Either<Failure, List<ProductEntity>>> searchProducts({
    required String searchQuery,
  });
}
