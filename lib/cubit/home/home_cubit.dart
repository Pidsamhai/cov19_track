import 'package:bloc/bloc.dart';
import 'package:cov19_stats/db/database.dart';
import 'package:cov19_stats/repository/ddc_repository.dart';
import 'package:flutter/foundation.dart';

part 'home_state.dart';

enum TimelineFilter {
  week,
  month,
  year,
}

class HomeCubit extends Cubit<HomeState> {
  final DDCRepository _repository;
  HomeCubit(this._repository) : super(HomeInitial());

  Future<void> getTimeline({
    TimelineFilter filter = TimelineFilter.week,
    bool forece = false,
  }) async {
    try {
      emit(const HomeLoading());
      if (filter == TimelineFilter.week) {
        emit(HomeLoaded(await _repository.timelineWeekly(forece)));
      } else if (filter == TimelineFilter.month) {
        emit(HomeLoaded(await _repository.timelineCurrentMonth(forece)));
      } else {
        emit(HomeLoaded(await _repository.timelineCurrentYear(forece)));
      }
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
