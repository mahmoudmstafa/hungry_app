import '../entities/cart_item_entity.dart';
import '../repos/cart_repo.dart';

class AddToCartUseCase {
  final CartRepo repo;

  AddToCartUseCase({
    required this.repo,
  });

  Future<void> call(CartItemEntity item) {
    return repo.addToCart(item);
  }
}