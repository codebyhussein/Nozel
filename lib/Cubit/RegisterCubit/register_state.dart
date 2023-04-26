part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {}

class RegisterPolicy extends RegisterState {}

class RegisterChange extends RegisterState {}

class RegisterFailure extends RegisterState {
  String errorMassege;
  RegisterFailure({required this.errorMassege});
}
