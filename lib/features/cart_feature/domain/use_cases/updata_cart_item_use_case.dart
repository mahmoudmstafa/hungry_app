


import '../entities/cart_item_entity.dart';
import '../repos/cart_repo.dart';

class UpdateCartItemUseCase {
  final CartRepo repo;

  UpdateCartItemUseCase({
    required this.repo,
  });

  Future<void> call(
      CartItemEntity item,
      int index,
      String userId,
      ) {
    return repo.updateItem(
      item,
      index,
      userId,
    );
  }
}