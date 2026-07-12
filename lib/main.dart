import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/utils/constant.dart';
import 'core/utils/firebase_options.dart';
import 'core/utils/service_locator.dart';
import 'core/utils/simple_bloc_observer.dart';
import 'features/home_feature/data/models/product_model.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(ProductModelAdapter());
  await Hive.openBox<ProductModel>(productBox);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = SimpleBlocObserver();
  await setupLocator();
  runApp(
    const HungryApp(),
  );
}