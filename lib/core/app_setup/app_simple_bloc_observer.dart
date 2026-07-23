





import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';


// Bloc.observer = SimpleBlocObserver(); in main.dart
class AppSimpleBlocObserver implements BlocObserver{
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    log('change --> $change');
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    log('onClose --> $bloc');
  }

  @override
  void onCreate(BlocBase<dynamic> bloc) {
    log('onCreate --> $bloc');
  }

  @override
  void onDone(Bloc<dynamic, dynamic> bloc, Object? event, [Object? error, StackTrace? stackTrace]) {
    // TODO: implement onDone
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    // TODO: implement onEvent
  }

  @override
  void onTransition(Bloc<dynamic, dynamic> bloc, Transition<dynamic, dynamic> transition) {
    log('onTransition --> $transition');
  }
}