



import 'package:get/get.dart';

import '../../features/aut_feature/presentation/views/login_view.dart';
import '../../features/aut_feature/presentation/views/sign_up_view.dart';
import '../../features/cart_feature/presentation/views/cart_view.dart';
import '../../features/checkout_feature/presentation/views/checkout_view.dart';
import '../../features/home_feature/presentation/views/home_view.dart';
import '../../features/product_details_feature/presentation/views/product_details_view.dart';
import '../../features/profile_feature/presentation/views/profile_view.dart';
import '../../features/splash_feature/presentation/views/splash_view.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: SplashView.id,
      page: () => const SplashView(),
    ),

    GetPage(
      name: HomeView.id,
      page: () => const HomeView(),
    ),

    GetPage(
      name: ProductDetailsView.id,
      page: () => const ProductDetailsView(),
    ),

    GetPage(
      name: CartView.id,
      page: () => const CartView(),
    ),

    GetPage(
      name: CheckoutView.id,
      page: () => const CheckoutView(),
    ),

    GetPage(
      name: ProfileView.id,
      page: () => const ProfileView(),
    ),

    GetPage(
      name: SignUpView.id,
      page: () => const SignUpView(),
    ),

    GetPage(
      name: LoginView.id,
      page: () => const LoginView(),
    ),
  ];
}