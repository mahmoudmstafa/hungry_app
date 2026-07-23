
import 'package:fpdart/fpdart.dart';

import '../../../../core/app_setup/app_failures.dart';
import '../../data/models/side_options_model.dart';
import '../../data/models/toppings_model.dart';

abstract class SideOptionsAndToppingsRepo {
  Future<Either<AppFailures, List<ToppingModel>>> getToppings();
  Future<Either<AppFailures, List<SideOptionsModel>>> getSideOptions();
}