import 'package:hive_ce/hive.dart';

import '../../domain/entities/product_entity.dart';

part 'product_model.g.dart';

@HiveType(typeId: 0)
class ProductModel extends ProductEntity {
  @HiveField(0)
  final String hiveId;

  @HiveField(1)
  final String hiveTitle;

  @HiveField(2)
  final String hiveDesc;

  @HiveField(3)
  final String hiveProductImage;

  @HiveField(4)
  final double hivePrice;

  @HiveField(5)
  final num hiveRate;

  @HiveField(6)
  final bool hiveIsFavourite;

  ProductModel({
    required super.id,
    required super.title,
    required super.desc,
    required super.productImage,
    required super.price,
    required super.rate,
    required super.isFavourite,
  })  : hiveId = id,
        hiveTitle = title,
        hiveDesc = desc,
        hiveProductImage = productImage,
        hivePrice = price,
        hiveRate = rate,
        hiveIsFavourite = isFavourite;

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id'],
      title: json['name'],
      desc: json['description'],
      productImage: json['image'],
      price: (json['price'] as num).toDouble(),
      rate: (json['rate'] ?? 0).toDouble(),
      isFavourite: json['isFavourite'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': title,
      'description': desc,
      'image': productImage,
      'price': price,
      'rate': rate,
      'isFavourite': isFavourite,
    };
  }
}