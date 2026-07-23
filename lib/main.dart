
import 'package:flutter/material.dart';
import 'app.dart';
import 'core/bootstrap/main_app_initializer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await MainAppInitializer.initialize();
  runApp(
    const HungryApp(),
  );
}

