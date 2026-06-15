import 'package:flutter/material.dart';

import 'features/home_feature/presentation/views/home_view.dart';
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
      },
      initialRoute: HomeView.id,
    );
  }
}

