import '../../../home_feature/domain/entities/product_entity.dart';
import '../repos/favorite_repo.dart';

class GetFavouriteUseCase {
  final FavouriteRepository repository;

  GetFavouriteUseCase(this.repository);

  List<ProductEntity> call(
      String userId,
      ) {
    return repository.getFavourites(userId);
  }
}