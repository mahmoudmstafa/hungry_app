import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry_app/features/home_feature/presention/views/widgets/app_bar_home_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String id = 'HomeView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Gap(70),
          AppBarHomeView()
        ],
      ),
    );
  }
}
