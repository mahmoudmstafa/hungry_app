import 'package:hive_ce/hive.dart';

import '../../models/product_model.dart';
import 'local_data_source.dart';

class LocalDataSourceImpl implements LocalDataSource {
  final Box<ProductModel> productsBox;

  LocalDataSourceImpl({required this.productsBox});

  @override
  Future<void> cacheProducts(List<ProductModel> products) async {
    await productsBox.clear();
    await productsBox.addAll(products);
  }

  @override
  List<ProductModel> getCachedProducts() {
    return productsBox.values.toList();
  }

  @override
  Future<void> clearCache() async {
    await productsBox.clear();
  }
}
