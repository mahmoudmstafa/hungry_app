import 'package:hive_ce/hive.dart';

import '../../models/cart_item_model.dart';
import 'local_data_source.dart';

class CartLocalDataSourceImpl implements CartLocalDataSource {
  final Box<CartItemModel> cartBox;

  CartLocalDataSourceImpl({
    required this.cartBox,
  });

  // add to cart
  @override
  Future<void> addToCart(CartItemModel item, String userId) async {
    await cartBox.add(item);
  }

  // get cart items
  @override
  List<CartItemModel> getCartItems(String userId) {
    return cartBox.values.where((e) => e.userId == userId).toList();
  }

  // remove item
  @override
  Future<void> removeItem(int index, String userId) async {
    final userItems = cartBox.values.where((e) => e.userId == userId).toList();

    if (index < 0 || index >= userItems.length) return;

    await userItems[index].delete();
  }

  @override
  Future<void> clearCart(String userId) async {
    final keys = cartBox.keys.where(
      (key) => cartBox.get(key)?.userId == userId,
    );

    await cartBox.deleteAll(keys);
  }

  // update item
  @override
  Future<void> updateItem(
    CartItemModel item,
    int index,
    String userId,
  ) async {
    await cartBox.putAt(index, item);
  }
}
