import '../../models/favorite_model.dart';

abstract class FavouriteLocalDataSource {
  Future<void> addFavourite(FavouriteModel item);

  Future<void> removeFavourite(
    String productId,
    String userId,
  );

  List<FavouriteModel> getFavourites(String userId);

  bool isFavourite(
    String productId,
    String userId,
  );
}
