import 'dart:math';

import 'package:cov19_stats/db/database.dart';
import 'package:cov19_stats/db/network_bound_resource.dart';
import 'package:cov19_stats/db/resource.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class DDCRepository {
  Future<TodayEntry> fetchToday();
  Stream<Resource<TodayEntry>> todayStream();
  Future<List<TimelineEntry>?> fetchTimeline();
}

@Injectable(as: DDCRepository)
class DDCRepositoryImpl implements DDCRepository {
  final Dio _dio;
  final AppDatabase _db;
  DDCRepositoryImpl(Dio dio, AppDatabase db)
      : _dio = dio,
        _db = db;

  @override
  Future<TodayEntry> fetchToday() async {
    try {
      Response<List> res = await _dio.get("/today-cases-all");
      TodayEntry? today = res.data?.map((e) => TodayEntry.fromJson(e)).first;
      return today!;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<TimelineEntry>> fetchTimeline() async {
    try {
      Response<List> res = await _dio.get("/timeline-cases-all");
      var entires = res.data?.map((e) {
        return TimelineEntry.fromJson(e);
      }).toList();
      return entires!;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Stream<Resource<TodayEntry>> todayStream() {
    return NetworkBoundResource<TodayEntry, TodayEntry?>().asStream(
        query: _db.todayStream,
        shouldFetch: (result) => Random().nextBool()/*result == null*/,
        fetch: () async {
          Response<List> res = await _dio.get("/today-cases-all");
          TodayEntry? today =
              res.data?.map((e) => TodayEntry.fromJson(e)).first;
          return today;
        },
        saveFetchResult: (result) {
          if (result == null) return;
          _db.insertToday(result);
        });
  }
}
