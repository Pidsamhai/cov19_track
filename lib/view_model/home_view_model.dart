import 'dart:async';
import 'package:cov19_stats/db/database.dart';
import 'package:cov19_stats/db/resource.dart';
import 'package:cov19_stats/repository/ddc_repository.dart';
import 'package:cov19_stats/view_model/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@singleton
class HomeViewModel with ChangeNotifier, BaseViewModel {
  late DDCRepository _repository;
  TodayEntry? _result;
  TodayEntry? get result => _result;

  final _today = StreamController<Resource<TodayEntry?>>();
  Stream<Resource<TodayEntry?>> get today => _today.stream;

  final _timeLine = StreamController<Resource<List<TodayEntry>>>();
  Stream<Resource<List<TodayEntry>>> get timeLine => _timeLine.stream;

  HomeViewModel({required DDCRepository repository}) {
    _repository = repository;
  }

  void refresh(int limit) {
    _timeLine.sink.addStream(_repository.timelineStream(limit));
  }

  void init(limit) {
    if (inited) return;
    _today.sink.addStream(_repository.todayStream());
    _timeLine.sink.addStream(_repository.timelineStream(limit));
    inited = true;
  }

  void dispose() {
    _today.close();
    _timeLine.close();
  }
}
