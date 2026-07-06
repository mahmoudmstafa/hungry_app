part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
final class AuthSuccess  extends AuthState {

  final UserEntity user;

  AuthSuccess({required this.user});
}
final class AuthFailure extends AuthState
{
  final String errMessage ;

  AuthFailure({required this.errMessage});

}
final class AuthLoading extends AuthState {}
