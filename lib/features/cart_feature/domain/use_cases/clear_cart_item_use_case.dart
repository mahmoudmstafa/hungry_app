import '../repos/cart_repo.dart';

class ClearCartUseCase {
  final CartRepo repo;

  ClearCartUseCase({
    required this.repo,
  });

  Future<void> call(String userId) {
    return repo.clearCart(userId);
  }
}