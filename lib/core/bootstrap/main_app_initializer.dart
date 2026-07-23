import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:hive_ce_flutter/adapters.dart';

import '../../hive_registrar.g.dart';
import '../network/firebase_options.dart';
import '../app_setup/app_service_locator.dart';
import '../app_setup/app_simple_bloc_observer.dart';
import '../widgets/root_controller.dart';
import 'hive_boxes.dart';

abstract class MainAppInitializer {

  static Future<void> initialize() async {
    await _initializeHive();
    await _initializeFirebase();
    _initializeBlocObserver();
    await _initializeServiceLocator();
    _initializeRootController();
  }

  static Future<void> _initializeHive() async {
    await Hive.initFlutter();
    Hive.registerAdapters();
    await HiveBoxes.openAllBoxes();
  }

  static Future<void> _initializeFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  static void _initializeBlocObserver() {
    Bloc.observer = AppSimpleBlocObserver();
  }

  static Future<void> _initializeServiceLocator() async {
    await setupLocator();
  }

  static void _initializeRootController() {
    Get.put(RootController(), permanent: true);
  }
}
