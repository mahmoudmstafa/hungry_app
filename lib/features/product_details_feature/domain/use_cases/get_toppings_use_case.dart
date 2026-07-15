
import 'package:fpdart/fpdart.dart';

import '../../../../core/utils/failures.dart';
import '../../data/models/toppings_model.dart';
import '../repos/side_options_and_toppings_repo_repo.dart';

class GetToppingsUseCase {
  final SideOptionsAndToppingsRepo repo;

  GetToppingsUseCase({
    required this.repo,
  });

  Future<Either<Failure, List<ToppingModel>>> call() {
    return repo.getToppings();
  }
}