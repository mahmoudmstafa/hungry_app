
import 'package:fpdart/fpdart.dart';

import '../../../../core/utils/failures.dart';
import '../../data/models/side_options_model.dart';
import '../../data/models/toppings_model.dart';

abstract class SideOptionsAndToppingsRepo {
  Future<Either<Failure, List<ToppingModel>>> getToppings();
  Future<Either<Failure, List<SideOptionsModel>>> getSideOptions();
}