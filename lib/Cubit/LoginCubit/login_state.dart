part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginChange extends LoginState {}

class LoginFailure extends LoginState {
  String errorMassege;
  LoginFailure({required this.errorMassege});
}
