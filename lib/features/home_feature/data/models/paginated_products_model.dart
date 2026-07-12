import '../../domain/entities/paginated_products_entity.dart';
import 'product_model.dart';

class PaginatedProductsModel extends PaginatedProductsEntity {
  PaginatedProductsModel({
    required super.products,
    required super.total,
  });

  factory PaginatedProductsModel.fromJson(Map<String, dynamic> json) {
    final List foodsJson = json['foods'];
    return PaginatedProductsModel(
      products: foodsJson
          .map(
            (e) => ProductModel.fromJson(e),
          )
          .toList(),
      total: json['total'],
    );
  }
}
