import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../domain/entities/product_entity.dart';
import '../../../../domain/use_cases/get_products_use_case.dart';
import '../../../../domain/use_cases/params/page_params.dart';

part 'get_product_state.dart';

class GetProductCubit extends Cubit<GetProductState> {
  GetProductCubit({required this.getProductsUseCase})
    : super(GetProductInitial());

  final GetProductsUseCase getProductsUseCase;

  List<ProductEntity> products = [];
  int currentPage = 1;
  int total = 0;
  bool isFetchingMore = false;

  bool get hasMore => products.length < total;
  String? selectedCategoryId;

  Future<void> getProducts({String? categoryId}) async {
    currentPage = 1;
    selectedCategoryId = categoryId;
    final cached = getProductsUseCase.getCachedProducts();
    if (cached.isNotEmpty) {
      products = cached;
      emit(
        GetProductsSuccess(
          products: products,
          hasMore: false,
          isFromCache: true,
        ),
      );
    } else {
      emit(GetProductsLoading());
    }

    final result = await getProductsUseCase.call(
      PageParams(
        page: 1,
        categoryId: categoryId,
      ),
    );

    result.fold(
      (failure) {
        if (cached.isEmpty) {
          emit(GetProductsFailure(errMessage: failure.errMessage));
        }
      },
      (data) {
        products = data.products;
        total = data.total;
        emit(
          GetProductsSuccess(
            products: products,
            hasMore: hasMore,
            isFromCache: false,
          ),
        );
      },
    );
  }

  Future<void> loadNextPage() async {
    if (isFetchingMore || !hasMore) return;

    isFetchingMore = true;
    emit(GetProductsLoadingMore(products: products));

    final nextPage = currentPage + 1;
    final result = await getProductsUseCase(
      PageParams(
        page: nextPage,
        categoryId: selectedCategoryId,
      ),
    );

    result.fold(
      (failure) {
        isFetchingMore = false;
        emit(
          GetProductsPaginationError(
            products: products,
            errMessage: failure.errMessage,
          ),
        );
      },
      (data) {
        currentPage = nextPage;
        final existingIds = products.map((p) => p.id).toSet();
        final newUniqueProducts = data.products
            .where((p) => !existingIds.contains(p.id))
            .toList();

        products = [...products, ...newUniqueProducts];
        total = data.total;
        isFetchingMore = false;
        emit(GetProductsSuccess(products: products, hasMore: hasMore));
      },
    );
  }
}
