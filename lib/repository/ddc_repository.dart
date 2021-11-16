import 'package:cov19_stats/db/database.dart';
import 'package:cov19_stats/db/network_bound_resource.dart';
import 'package:dio/dio.dart';

abstract class DDCRepository {
  Future<TodayEntry> fetchToday();
  Future<List<TodayEntry>> timelineWeekly(bool force);
  Future<List<TodayEntry>> timelineCurrentYear(bool force);
  Future<List<TodayEntry>> timelineCurrentMonth(bool force);
}

class DDCRepositoryImpl implements DDCRepository {
  static DDCRepositoryImpl? _instance;
  final Dio _dio;
  final AppDatabase _db;

  DDCRepositoryImpl._internal(this._dio, this._db) {
    _instance = this;
  }

  factory DDCRepositoryImpl(Dio dio, AppDatabase db) {
    return _instance ?? DDCRepositoryImpl._internal(dio, db);
  }

  static const int _10_min = 600000;
  DateTime? lastFetch;

  bool shouldFetch() {
    print("Time $lastFetch");
    if (lastFetch == null) {
      lastFetch = DateTime.now();
      return true;
    } else {
      var now = DateTime.now();
      var lastEpoc = lastFetch!.millisecondsSinceEpoch;
      var nowEpoc = now.millisecondsSinceEpoch;
      var timeDiff = nowEpoc - lastEpoc;
      print("TimeDiff $timeDiff");
      if (timeDiff >= _10_min) {
        lastFetch = now;
        return true;
      } else {
        return false;
      }
    }
  }

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
  Future<List<TodayEntry>> timelineWeekly(bool forece) async {
    return resource<List<TodayEntry>, List<TodayEntry>>(
        query: () async => _db.getTimelineWeekly(),
        shouldFetch: (cache) => cache == null || shouldFetch() || forece,
        fetch: () async {
          Response<List> res = await _dio.get("/timeline-cases-all");
          return res.data?.map((e) => TodayEntry.fromJson(e)).toList();
        },
        saveFetchResult: (data) => _db.insertTimeline(data));
  }

  @override
  Future<List<TodayEntry>> timelineCurrentYear(bool force) {
    return resource<List<TodayEntry>, List<TodayEntry>>(
        query: () async => _db.getTimelineCurrentYear(),
        shouldFetch: (cache) => cache == null || shouldFetch() || force,
        fetch: () async {
          Response<List> res = await _dio.get("/timeline-cases-all");
          return res.data?.map((e) => TodayEntry.fromJson(e)).toList();
        },
        saveFetchResult: (data) => _db.insertTimeline(data));
  }

  @override
  Future<List<TodayEntry>> timelineCurrentMonth(bool force) {
    return resource<List<TodayEntry>, List<TodayEntry>>(
        query: () async => _db.getTimelineCurrentMonth(),
        shouldFetch: (cache) => cache == null || shouldFetch() || force,
        fetch: () async {
          Response<List> res = await _dio.get("/timeline-cases-all");
          return res.data?.map((e) => TodayEntry.fromJson(e)).toList();
        },
        saveFetchResult: (data) => _db.insertTimeline(data));
  }
}
