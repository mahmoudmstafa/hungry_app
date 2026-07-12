import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../domain/entities/product_entity.dart';
import '../../../../domain/use_cases/search_products_use_case.dart';

part 'search_products_state.dart';

class SearchProductsCubit extends Cubit<SearchProductsState> {
  SearchProductsCubit({required this.searchProductsUseCase})
    : super(SearchProductsInitial());

  final SearchProductsUseCase searchProductsUseCase;

  Timer? debounceTimer;

  void onSearchQueryChanged(String searchQuery) {
    // نلغي أي مؤقت سابق كل ما اليوزر يكتب حرف جديد
    debounceTimer?.cancel();

    // لو اليوزر مسح كل الكلام، نرجع للحالة الأولية ومنبعتش أي طلب
    if (searchQuery.trim().isEmpty) {
      emit(SearchProductsInitial());
      return;
    }

    // بننتظر نص ثانية بعد آخر حرف كتبه اليوزر قبل ما نبعت الطلب فعليًا
    debounceTimer = Timer(const Duration(milliseconds: 500), () {
      searchProducts(searchQuery);
    });
  }

  Future<void> searchProducts(String searchQuery) async {
    emit(SearchProductsLoading());

    final result = await searchProductsUseCase.call(searchQuery);

    result.fold(
      (failure) {
        emit(SearchProductsFailure(errMessage: failure.errMessage));
      },
      (products) {
        emit(SearchProductsSuccess(products: products));
      },
    );
  }

  @override
  Future<void> close() {
    debounceTimer?.cancel();
    return super.close();
  }
}
