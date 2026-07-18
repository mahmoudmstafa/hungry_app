import 'package:hive_ce/hive.dart';

import '../../../home_feature/domain/entities/product_entity.dart';

part 'favorite_model.g.dart';

@HiveType(typeId: 9)
class FavouriteModel extends HiveObject{
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

  @HiveField(8)
  final String userId;

  FavouriteModel({
    required this.id,
    required this.title,
    required this.desc,
    required this.productImage,
    required this.price,
    required this.rate,
    required this.isFavourite,
    required this.categoryId,
    required this.userId,
  });

  factory FavouriteModel.fromProduct(
      ProductEntity product,
      String userId,
      ) {
    return FavouriteModel(
      id: product.id,
      title: product.title,
      desc: product.desc,
      productImage: product.productImage,
      price: product.price,
      rate: product.rate,
      isFavourite: true,
      categoryId: product.categoryId,
      userId: userId,
    );
  }

  ProductEntity toProductEntity() {
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
}