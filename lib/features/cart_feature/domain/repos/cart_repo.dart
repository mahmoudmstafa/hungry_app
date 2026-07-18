import '../entities/cart_item_entity.dart';

abstract class CartRepo {
  Future<void> addToCart(CartItemEntity item, String userId);

  List<CartItemEntity> getCartItems(String userId);

  Future<void> updateItem(
      CartItemEntity item,
      int index,
      String userId,
      );

  Future<void> removeCartItem(
      int index,
      String userId,
      );

  Future<void> clearCart(String userId);
}