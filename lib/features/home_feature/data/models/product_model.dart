import 'package:hive_ce/hive.dart';

import '../../domain/entities/product_entity.dart';

part 'product_model.g.dart';
@HiveType(typeId: 0)
class ProductModel extends HiveObject implements ProductEntity {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String desc;

  @HiveField(3)
  final String productImage;

  @HiveField(4)
  final double price;

  @HiveField(5)
  final num rate;

  @HiveField(6)
  final bool isFavourite;

  @HiveField(7)
  final String categoryId;

  ProductModel({
    required this.id,
    required this.title,
    required this.desc,
    required this.productImage,
    required this.price,
    required this.rate,
    required this.isFavourite,
    required this.categoryId,
  });

  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      title: title,
      desc: desc,
      productImage: productImage,
      price: price,
      rate: rate,
      isFavourite: isFavourite,
      categoryId: categoryId,
    );
  }

  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      id: entity.id,
      title: entity.title,
      desc: entity.desc,
      productImage: entity.productImage,
      price: entity.price,
      rate: entity.rate,
      isFavourite: entity.isFavourite,
      categoryId: entity.categoryId,
    );
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id'],
      title: json['name'],
      desc: json['description'],
      productImage: json['image'],
      price: (json['price'] as num).toDouble(),
      rate: (json['rate'] ?? 0).toDouble(),
      isFavourite: json['isFavourite'] ?? false,
      categoryId: json['categoryId'],
    );
  }
}