import 'package:get/get.dart';

import '../../features/aut_feature/presentation/views/login_view.dart';
import '../../features/aut_feature/presentation/views/sign_up_view.dart';
import '../../features/cart_feature/presentation/views/cart_view.dart';
import '../../features/checkout_and_order_history_feature/presentation/views/checkout_view.dart';
import '../../features/home_feature/presentation/views/home_view.dart';
import '../../features/checkout_and_order_history_feature/presentation/views/order_history_view.dart';
import '../../features/product_details_feature/presentation/views/product_details_view.dart';
import '../../features/profile_feature/presentation/views/profile_view.dart';
import '../../features/splash_feature/presentation/views/splash_view.dart';
import '../../root_view.dart';

abstract class AppRoutes {
  static const String splash = "/splash";
  static const String rootView = "/rootView";
  static const String home = "/home";
  static const String productDetails = "/product-details";
  static const String cart = "/cart";
  static const String checkout = "/checkout";
  static const String profile = "/profile";
  static const String signUp = "/sign-up";
  static const String login = "/login";
  static const String orderHistory = "/orderHistory";
  static final routes = [
    GetPage(
      name: splash,
      page: () => const SplashView(),
      transition: Transition.fade,
      transitionDuration: const Duration(
        seconds: 2,
      ),
    ),
    GetPage(
      name: rootView,
      page: () => RootView(),
      transition: Transition.cupertinoDialog,
      transitionDuration: const Duration(
        seconds: 2,
      ),
    ),
    GetPage(
      name: signUp,
      page: () => const SignUpView(),
      transition: Transition.fade,
      transitionDuration: const Duration(
        milliseconds: 1000,
      ),
    ),

    GetPage(
      name: login,
      page: () => const LoginView(),
      transition: Transition.fade,
      transitionDuration: const Duration(
        milliseconds: 1000,
      ),
    ),
    GetPage(
      name: home,
      page: () => const HomeView(),
      transition: Transition.cupertinoDialog,
      transitionDuration: const Duration(
        milliseconds: 500,
      ),
    ),

    GetPage(
      name: productDetails,
      page: () => const ProductDetailsView(),
      transition: Transition.zoom,
      transitionDuration: const Duration(
        milliseconds: 500,
      ),
    ),

    GetPage(
      name: cart,
      page: () => const CartView(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(
        milliseconds: 700,
      ),
    ),

    GetPage(
      name: checkout,
      page: () => const CheckoutView(),
      transition: Transition.cupertinoDialog,
      transitionDuration: const Duration(
        milliseconds: 700,
      ),
    ),

    GetPage(
      name: profile,
      page: () => const ProfileView(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(
        milliseconds: 700,
      ),
    ),
    GetPage(
      name: orderHistory,
      page: () => const OrderHistoryView(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(
        milliseconds: 700,
      ),
    ),
  ];
}
