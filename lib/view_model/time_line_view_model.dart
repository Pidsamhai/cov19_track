import 'package:cov19_stats/db/database.dart';
import 'package:cov19_stats/repository/ddc_repository.dart';
import 'package:cov19_stats/view_model/base_view_model.dart';
import 'package:flutter/material.dart';

class TimelineViewModel with ChangeNotifier, BaseViewModel {
  DDCRepository repository;
  List<TimelineEntry>? _result;
  List<TimelineEntry>? get result => _result;

  TimelineViewModel({required this.repository});

  Future fetch() async {
    try {
      // _result = await repository.fetchTimeline();
      // if (!inited) inited = true;
      // notifyListeners();
      throw Exception("Error");
    } catch (e) {
      return;
    }
  }
}
