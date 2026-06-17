import 'package:flutter/material.dart';

import 'features/aut_feature/presentation/views/login_view.dart';
import 'features/aut_feature/presentation/views/sign_up_view.dart';
import 'features/cart_feature/presentation/views/cart_view.dart';
import 'features/checkout_feature/presentation/views/checkout_view.dart';
import 'features/home_feature/presentation/views/home_view.dart';
import 'features/product_details_feature/presentation/views/product_details_view.dart';
import 'features/profile_feature/presentation/views/profile_view.dart';
import 'features/splash_view.dart';

void main() {
  runApp(
    const HungryApp(),
  );
}

class HungryApp extends StatelessWidget {
  const HungryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        SplashView.id: (context) => const SplashView(),
        HomeView.id: (context) => const HomeView(),
        ProductDetailsView.id: (context) => const ProductDetailsView(),
        CartView.id: (context) => const CartView(),
        CheckoutView.id: (context) => const CheckoutView(),
        ProfileView.id: (context) => const ProfileView(),
        SignUpView.id: (context) => const SignUpView(),
        LoginView.id: (context) => const LoginView(),
      },
      initialRoute: LoginView.id,
    );
  }
}

