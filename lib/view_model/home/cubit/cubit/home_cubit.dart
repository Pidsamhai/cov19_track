import 'package:bloc/bloc.dart';
import 'package:cov19_stats/db/database.dart';
import 'package:cov19_stats/repository/ddc_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

part 'home_state.dart';

@singleton
class HomeCubit extends Cubit<HomeState> {
  final DDCRepository _repository;
  HomeCubit(this._repository) : super(HomeInitial());

  Future<void> getTimeline({int limit = 7}) async {
    try {
      emit(const HomeLoading());
      emit(HomeLoaded(await _repository.timeline(limit)));
    } catch(e) {
      emit(HomeError(e.toString()));
    }
  }
}
