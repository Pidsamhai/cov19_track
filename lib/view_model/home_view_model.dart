import 'package:cov19_stats/db/database.dart';
import 'package:cov19_stats/db/resource.dart';
import 'package:cov19_stats/repository/ddc_repository.dart';
import 'package:cov19_stats/view_model/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@singleton
class HomeViewModel with ChangeNotifier, BaseViewModel {
  DDCRepository repository;
  TodayEntry? _result;
  TodayEntry? get result => _result;

  Stream<Resource<TodayEntry>?>? _resultStream;
  Stream<Resource<TodayEntry>?>? get resultStream => _resultStream;

  HomeViewModel({required this.repository})
      : _resultStream = repository.todayStream();

  void refresh() {
    _resultStream = repository.todayStream();
    notifyListeners();
  }

  Future fetch() async {
    try {
      _result = await repository.fetchToday();
      if (!inited) inited = true;
      notifyListeners();
    } catch (e) {
      return;
    }
  }
}
