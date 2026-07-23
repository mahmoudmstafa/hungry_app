


import 'package:hive_ce/hive.dart';

import '../../features/cart_feature/data/models/cart_item_model.dart';
import '../../features/checkout_and_order_history_feature/data/models/order_model.dart';
import '../../features/favourite_feature/data/models/favorite_model.dart';
import '../../features/home_feature/data/models/product_model.dart';

abstract class HiveBoxes {
  static const String productBox = 'productsBox';
  static const String cartBox = 'cartBox';
  static const String favoriteBox = 'favoriteBox';
  static const String ordersBox = 'ordersBox';

  static Future<void> openAllBoxes() async {
    await Hive.openBox<FavouriteModel>(favoriteBox);
    await Hive.openBox<OrderModel>(ordersBox);
    await Hive.openBox<ProductModel>(productBox);
    await Hive.openBox<CartItemModel>(cartBox);
  }
}
