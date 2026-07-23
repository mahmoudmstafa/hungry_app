import 'package:hive_ce/hive.dart';

import '../../models/favorite_model.dart';
import 'local_data_source.dart';

class FavouriteLocalDataSourceImpl implements FavouriteLocalDataSource {
  final Box<FavouriteModel> favouriteBox;

  FavouriteLocalDataSourceImpl({
    required this.favouriteBox,
  });

  // add favourite
  @override
  Future<void> addFavourite(FavouriteModel item) async {
    await favouriteBox.add(item);
  }

  // remove favourite
  @override
  Future<void> removeFavourite(
    String productId,
    String userId,
  ) async {
    final item = favouriteBox.values.firstWhere(
      (e) => e.id == productId && e.userId == userId,
    );

    await item.delete();
  }

  // get favourites
  @override
  List<FavouriteModel> getFavourites(String userId) {
    return favouriteBox.values
        .where(
          (e) => e.userId == userId,
        )
        .toList();
  }

  // check if favourite
  @override
  bool isFavourite(
    String productId,
    String userId,
  ) {
    return favouriteBox.values.any(
      (e) => e.id == productId && e.userId == userId,
    );
  }
}
