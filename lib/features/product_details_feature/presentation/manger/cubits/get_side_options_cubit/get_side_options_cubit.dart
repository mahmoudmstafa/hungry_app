import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../data/models/side_options_model.dart';
import '../../../../domain/use_cases/get_side_options_use_case.dart';

part 'get_side_options_state.dart';

class GetSideOptionsCubit extends Cubit<GetSideOptionsState> {
  GetSideOptionsCubit({
    required this.getSideOptionsUseCase,
  }) : super(GetSideOptionsInitial());
  final GetSideOptionsUseCase getSideOptionsUseCase;

  // side options
  Future<void> getSideOptions() async {
    emit(GetSideOptionsLoading());

    final result = await getSideOptionsUseCase();

    result.fold(
      (failure) => emit(
        GetSideOptionsError(message: failure.errMessage),
      ),
      (sideOptions) => emit(
        GetSideOptionsLoaded(
          sideOptions: sideOptions,
        ),
      ),
    );
  }
}
