import 'package:fpdart/src/either.dart';
import 'package:hungry_app/core/app_setup/app_failures.dart';
import 'package:hungry_app/core/app_setup/app_use_case.dart';
import 'package:hungry_app/features/home_feature/domain/entities/product_entity.dart';
import 'package:hungry_app/features/home_feature/domain/use_cases/params/page_params.dart';

import '../entities/paginated_products_entity.dart';
import '../repos/home_repo.dart';

class GetProductsUseCase
    implements AppUseCase<PaginatedProductsEntity, PageParams> {
  final HomeRepo homeRepo;

  GetProductsUseCase({required this.homeRepo});

  @override
  Future<Either<AppFailures, PaginatedProductsEntity>> call(
    PageParams params,
  ) async {
    return await homeRepo.getProducts(
      page: params.page,
      categoryId: params.categoryId,
    );
  }

  List<ProductEntity> getCachedProducts() {
    return homeRepo.getCachedProducts();
  }
}
