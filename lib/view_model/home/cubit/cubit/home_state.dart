part of 'home_cubit.dart';

@immutable
abstract class HomeState {
  const HomeState();
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {
  const HomeLoading();
}

class HomeLoaded extends HomeState {
  final List<TodayEntry> timeline;
  const HomeLoaded(this.timeline);
}

class HomeError extends HomeState {
  final String message;
  const HomeError(this.message);
}
