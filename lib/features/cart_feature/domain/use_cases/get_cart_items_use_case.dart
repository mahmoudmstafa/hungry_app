import '../entities/cart_item_entity.dart';
import '../repos/cart_repo.dart';

class GetCartItemsUseCase {
  final CartRepo repo;

  GetCartItemsUseCase({
    required this.repo,
  });

  List<CartItemEntity> call(String userId) {
    return repo.getCartItems(userId);
  }
}