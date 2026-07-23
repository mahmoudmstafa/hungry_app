
import 'package:fpdart/fpdart.dart';

import '../../../../core/app_setup/app_failures.dart';
import '../../data/models/side_options_model.dart';
import '../repos/side_options_and_toppings_repo_repo.dart';

class GetSideOptionsUseCase {
  final SideOptionsAndToppingsRepo repo;

  GetSideOptionsUseCase({
    required this.repo,
  });

  Future<Either<AppFailures, List<SideOptionsModel>>> call() {
    return repo.getSideOptions();
  }
}