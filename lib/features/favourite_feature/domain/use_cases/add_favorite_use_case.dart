import '../../../home_feature/domain/entities/product_entity.dart';
import '../repos/favorite_repo.dart';

class AddFavouriteUseCase {
  final FavouriteRepository repository;

  AddFavouriteUseCase(this.repository);

  Future<void> call(
      ProductEntity product,
      String userId,
      ) {
    return repository.addFavourite(product, userId);
  }
}