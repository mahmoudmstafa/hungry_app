


import 'package:fpdart/fpdart.dart';

import '../../../../core/app_setup/app_failures.dart';
import '../../../../core/app_setup/app_use_case.dart';
import '../entities/category_entity.dart';
import '../repos/home_repo.dart';

class GetCategoriesUseCase implements AppUseCase<List<CategoryEntity>, NoParams> {
  final HomeRepo homeRepo;

  GetCategoriesUseCase({required this.homeRepo});

  @override
  Future<Either<AppFailures, List<CategoryEntity>>> call(NoParams params) async {
    return await homeRepo.getCategories();
  }
}