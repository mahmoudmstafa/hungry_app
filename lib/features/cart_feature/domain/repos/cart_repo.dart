import '../entities/cart_item_entity.dart';

abstract class CartRepo {
  Future<void> addToCart(CartItemEntity item);

  List<CartItemEntity> getCartItems(String userId);
  Future<void> removeCartItem(int index);

  Future<void> clearCart(String userId);}