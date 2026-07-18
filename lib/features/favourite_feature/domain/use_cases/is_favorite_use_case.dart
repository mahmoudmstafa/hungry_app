import '../repos/favorite_repo.dart';

class IsFavouriteUseCase {
  final FavouriteRepository repository;

  IsFavouriteUseCase(this.repository);

  bool call(
      String productId,
      String userId,
      ) {
    return repository.isFavourite(productId, userId);
  }
}