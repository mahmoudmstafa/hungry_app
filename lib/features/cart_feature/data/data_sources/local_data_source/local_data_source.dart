import '../../models/cart_item_model.dart';

abstract class CartLocalDataSource {
  Future<void> addToCart(CartItemModel item, String userId);

  List<CartItemModel> getCartItems(String userId);

  Future<void> updateItem(
      CartItemModel item,
      int index,
      String userId,
      );

  Future<void> removeItem(
      int index,
      String userId,
      );

  Future<void> clearCart(String userId);
}