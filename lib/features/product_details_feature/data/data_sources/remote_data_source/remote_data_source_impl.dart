import 'dart:developer';

import 'package:hungry_app/core/network/dio_service.dart';
import 'package:hungry_app/features/product_details_feature/data/models/toppings_model.dart';

import '../../models/side_options_model.dart';
import 'remote_data_source.dart';

class ToppingRemoteDataSourceImpl
    implements ToppingRemoteDataSource {
  final DioService dioService;

  ToppingRemoteDataSourceImpl({
    required this.dioService,
  });

  // get all toppings
  @override
  Future<List<ToppingModel>> getToppings() async {
    final response = await dioService.dio.get('/toppings');
    log(response.data.toString());
    final List data = response.data;

    return data
        .map((e) => ToppingModel.fromJson(e))
        .toList();
  }

  // get all side options
  @override
  Future<List<SideOptionsModel>> getSideOptions() async {
    final response = await dioService.dio.get('/sideOptions');
    log(response.data.toString());

    final List data = response.data;

    return data
        .map((e) => SideOptionsModel.fromJson(e))
        .toList();
  }
}