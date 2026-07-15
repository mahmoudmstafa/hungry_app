import 'package:hive_ce/hive.dart';

import '../../models/cart_item_model.dart';
import 'local_data_source.dart';

class CartLocalDataSourceImpl implements CartLocalDataSource {
  final Box<CartItemModel> cartBox;

  CartLocalDataSourceImpl({
    required this.cartBox,
  });

  @override
  Future<void> addToCart(CartItemModel item) async {
    await cartBox.add(item);
  }

  @override
  List<CartItemModel> getCartItems(String userId) {
    return cartBox.values
        .where((e) => e.userId == userId)
        .toList();
  }

  @override
  Future<void> removeItem(int index) async {
    await cartBox.deleteAt(index);
  }

  @override
  Future<void> clearCart(String userId) async {
    final keys = cartBox.keys.where(
          (key) => cartBox.get(key)?.userId == userId,
    );

    await cartBox.deleteAll(keys);
  }
}