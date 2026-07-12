


import 'package:fpdart/fpdart.dart';

import '../../../../core/utils/failures.dart';
import '../../../../core/utils/use_case.dart';
import '../entities/category_entity.dart';
import '../repos/home_repo.dart';

class GetCategoriesUseCase implements UseCase<List<CategoryEntity>, NoParams> {
  final HomeRepo homeRepo;

  GetCategoriesUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<CategoryEntity>>> call(NoParams params) async {
    return await homeRepo.getCategories();
  }
}