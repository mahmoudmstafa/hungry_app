import 'package:hungry_app/features/home_feature/domain/entities/product_entity.dart';

class PaginatedProductsEntity {
  final List<ProductEntity> products;
  final int total;

  PaginatedProductsEntity({
    required this.products,
    required this.total,
  });
}
