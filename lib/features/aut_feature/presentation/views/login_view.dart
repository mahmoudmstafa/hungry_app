import 'package:flutter/material.dart';
import 'package:hungry_app/core/widgets/custom_scaffold.dart';
import 'package:hungry_app/features/aut_feature/presentation/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const String id = 'LoginView';

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      child: LoginViewBody(),
    );
  }
}