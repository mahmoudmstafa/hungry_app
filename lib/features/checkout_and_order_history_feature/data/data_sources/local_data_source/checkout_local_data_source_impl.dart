import 'package:hive_ce/hive.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../cart_feature/data/models/cart_item_model.dart';
import '../../models/order_model.dart';
import 'checkout_local_data_source.dart';

class CheckoutLocalDataSourceImpl implements CheckoutLocalDataSource {
  final Box<OrderModel> ordersBox;
  final Box<CartItemModel> cartBox;

  CheckoutLocalDataSourceImpl({
    required this.ordersBox,
    required this.cartBox,
  });

  @override
  Future<void> placeOrder(OrderModel order) async {
    await ordersBox.add(order);
  }

  @override
  List<OrderModel> getOrders(String userId) {
    return ordersBox.values.where((e) => e.userId == userId).toList();
  }

  @override
  Future<void> clearCart(String userId) async {
    final items = cartBox.values.where((e) => e.userId == userId).toList();

    for (final item in items) {
      await item.delete();
    }
  }
}
