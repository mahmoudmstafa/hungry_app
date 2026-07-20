import '../../../cart_feature/domain/repos/cart_repo.dart';

class ClearCartUseCase {
  final CartRepo repo;

  ClearCartUseCase(this.repo);

  Future<void> call(String userId) {
    return repo.clearCart(userId);
  }
}