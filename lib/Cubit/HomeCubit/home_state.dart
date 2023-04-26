part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {}

class HomeChange1 extends HomeState {}

class HomeChange2 extends HomeState {}

class HomeFailure extends HomeState {
  String errorMassege;
  HomeFailure({required this.errorMassege});
}
