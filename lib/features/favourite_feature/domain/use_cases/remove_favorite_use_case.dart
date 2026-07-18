import '../repos/favorite_repo.dart';

class RemoveFavouriteUseCase {
  final FavouriteRepository repository;

  RemoveFavouriteUseCase(this.repository);

  Future<void> call(
      String productId,
      String userId,
      ) {
    return repository.removeFavourite(productId, userId);
  }
}