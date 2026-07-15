import '../../models/cart_item_model.dart';

abstract class CartLocalDataSource {
  Future<void> addToCart(CartItemModel item);

  List<CartItemModel> getCartItems(String userId);

  Future<void> removeItem(int index);

  Future<void> clearCart(String userId);
}