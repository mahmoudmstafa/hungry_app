import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'core/app_setup/app_providers.dart';
import 'core/app_setup/app_routes.dart';


class HungryApp extends StatelessWidget {
  const HungryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppProviders.hungryAppProviders(),
      child: GetMaterialApp(
        theme: ThemeData(
          fontFamily: 'Roboto',
        ),
        debugShowCheckedModeBanner: false,
        getPages: AppRoutes.routes,
        initialRoute: AppRoutes.splash,
      ),
    );
  }
}
