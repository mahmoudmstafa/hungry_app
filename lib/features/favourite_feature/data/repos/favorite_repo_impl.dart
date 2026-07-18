import '../../../home_feature/domain/entities/product_entity.dart';
import '../../domain/repos/favorite_repo.dart';
import '../data_sources/remote_data_source/local_data_source.dart';
import '../models/favorite_model.dart';

class FavouriteRepositoryImpl
    implements FavouriteRepository {
  final FavouriteLocalDataSource localDataSource;

  FavouriteRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<void> addFavourite(
      ProductEntity product,
      String userId,
      ) async {
    await localDataSource.addFavourite(
      FavouriteModel.fromProduct(
        product,
        userId,
      ),
    );
  }

  @override
  Future<void> removeFavourite(
      String productId,
      String userId,
      ) async {
    await localDataSource.removeFavourite(
      productId,
      userId,
    );
  }

  @override
  List<ProductEntity> getFavourites(
      String userId,
      ) {
    return localDataSource
        .getFavourites(userId)
        .map((e) => e.toProductEntity())
        .toList();
  }

  @override
  bool isFavourite(
      String productId,
      String userId,
      ) {
    return localDataSource.isFavourite(
      productId,
      userId,
    );
  }
}