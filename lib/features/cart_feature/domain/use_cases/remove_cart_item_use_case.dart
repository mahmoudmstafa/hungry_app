import '../repos/cart_repo.dart';

class RemoveCartItemUseCase {
  final CartRepo repo;

  RemoveCartItemUseCase({
    required this.repo,
  });

  Future<void> call(int index , String userId) {
    return repo.removeCartItem(index , userId);
  }
}