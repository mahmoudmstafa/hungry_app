import 'package:hungry_app/features/home_feature/data/models/category_model.dart';

import '../../models/paginated_products_model.dart';
import '../../models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<PaginatedProductsModel> getProducts({
    required int page,
    int limit = 10,
    String? categoryId,
  });

  Future<List<CategoryModel>> getCategories();
  Future<List<ProductModel>> searchProducts({
    required String searchQuery,
  });
}
