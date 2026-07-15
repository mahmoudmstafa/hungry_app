
import 'package:fpdart/fpdart.dart';

import '../../../../core/utils/failures.dart';
import '../../data/models/side_options_model.dart';
import '../../data/models/toppings_model.dart';
import '../repos/side_options_and_toppings_repo_repo.dart';

class GetSideOptionsUseCase {
  final SideOptionsAndToppingsRepo repo;

  GetSideOptionsUseCase({
    required this.repo,
  });

  Future<Either<Failure, List<SideOptionsModel>>> call() {
    return repo.getSideOptions();
  }
}