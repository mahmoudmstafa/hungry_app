import '../../../home_feature/domain/entities/product_entity.dart';

abstract class FavouriteRepository {
  Future<void> addFavourite(
      ProductEntity product,
      String userId,
      );

  Future<void> removeFavourite(
      String productId,
      String userId,
      );

  List<ProductEntity> getFavourites(
      String userId,
      );

  bool isFavourite(
      String productId,
      String userId,
      );
}