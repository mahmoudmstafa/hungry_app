


import 'package:flutter/cupertino.dart';

import '../../features/cart_feature/presentation/views/cart_view.dart';
import '../../features/checkout_and_order_history_feature/presentation/views/order_history_view.dart';
import '../../features/favourite_feature/presentation/views/favourites_view.dart';
import '../../features/home_feature/presentation/views/home_view.dart';
import '../../features/profile_feature/presentation/views/profile_view.dart';

abstract class AppPages {
  static Widget homePage() => const HomeView();

  static Widget cartPage() => const CartView();

  static Widget favouritesPage() => const FavouritesView();

  static Widget orderHistoryPage() => const OrderHistoryView();

  static Widget profilePage() => const ProfileView();
}
