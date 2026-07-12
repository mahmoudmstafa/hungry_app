import '../../models/product_model.dart';

abstract class LocalDataSource {
  Future<void> cacheProducts(List<ProductModel> products);
  List<ProductModel> getCachedProducts();
  Future<void> clearCache();
}