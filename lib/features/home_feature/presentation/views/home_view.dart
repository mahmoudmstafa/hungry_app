import 'package:flutter/material.dart';
import 'package:hungry_app/core/widgets/custom_scaffold.dart';
import 'package:hungry_app/features/home_feature/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String id = 'HomeView';

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      resizeToAvoidBottomInset: false,
      child: HomeViewBody(),
    );
  }
}
