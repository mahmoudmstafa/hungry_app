import 'package:hungry_app/features/product_details_feature/data/models/side_options_model.dart';

import '../../models/toppings_model.dart';

abstract class ToppingRemoteDataSource {
  Future<List<ToppingModel>> getToppings();

  Future<List<SideOptionsModel>> getSideOptions();
}
