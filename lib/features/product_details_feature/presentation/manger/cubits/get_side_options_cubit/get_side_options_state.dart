part of 'get_side_options_cubit.dart';

@immutable
sealed class GetSideOptionsState {}

final class GetSideOptionsInitial extends GetSideOptionsState {}
final class GetSideOptionsLoading extends GetSideOptionsState {}

final class GetSideOptionsLoaded extends GetSideOptionsState {

  final List<SideOptionsModel> sideOptions;

  GetSideOptionsLoaded({required this.sideOptions});

}

final class GetSideOptionsError extends GetSideOptionsState {
  final String message;

  GetSideOptionsError({required this.message});
}

