import 'package:cov19_stats/db/database.dart';
import 'package:cov19_stats/db/network_bound_resource.dart';
import 'package:cov19_stats/db/resource.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class DDCRepository {
  Future<TodayEntry> fetchToday();
  Stream<Resource<TodayEntry>> todayStream();
  Stream<Resource<List<TodayEntry>>> timelineStream(int limit);
  Future<List<TodayEntry>> timelineWeekly();
  Future<List<TodayEntry>> timelineCurrentYear();
  Future<List<TodayEntry>> timelineCurrentMonth();
}

@Injectable(as: DDCRepository)
class DDCRepositoryImpl implements DDCRepository {
  final Dio _dio;
  final AppDatabase _db;
  DDCRepositoryImpl(Dio dio, AppDatabase db)
      : _dio = dio,
        _db = db;
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
  Stream<Resource<TodayEntry>> todayStream() {
    return NetworkBoundResource<TodayEntry, TodayEntry>().asStream(
        query: _db.todayStream,
        shouldFetch: (result) => result == null || shouldFetch(),
        fetch: () async {
          Response<List> res = await _dio.get("/today-cases-all");
          TodayEntry? today =
              res.data?.map((e) => TodayEntry.fromJson(e)).first;
          return today!;
        },
        saveFetchResult: (result) async => _db.insertToday(result));
  }

  @override
  Stream<Resource<List<TodayEntry>>> timelineStream(int limit) {
    return NetworkBoundResource<List<TodayEntry>, List<TodayEntry>>().asStream(
      query: () => _db.timelineStream(limit),
      shouldFetch: (result) => result == null || shouldFetch(),
      fetch: () async {
        Response<List> res = await _dio.get("/timeline-cases-all");
        var entires = res.data?.map((e) {
          return TodayEntry.fromJson(e);
        }).toList();
        return entires!;
      },
      saveFetchResult: (result) async => _db.insertTimeline(result),
    );
  }

  @override
  Future<List<TodayEntry>> timelineWeekly() async {
    return resource<List<TodayEntry>, List<TodayEntry>>(
        query: () async => _db.getTimelineWeekly(),
        shouldFetch: (cache) => cache == null || shouldFetch(),
        fetch: () async {
          Response<List> res = await _dio.get("/timeline-cases-all");
          return res.data?.map((e) => TodayEntry.fromJson(e)).toList();
        },
        saveFetchResult: (data) => _db.insertTimeline(data));
  }

  @override
  Future<List<TodayEntry>> timelineCurrentYear() {
    return resource<List<TodayEntry>, List<TodayEntry>>(
        query: () async => _db.getTimelineCurrentYear(),
        shouldFetch: (cache) => cache == null || shouldFetch(),
        fetch: () async {
          Response<List> res = await _dio.get("/timeline-cases-all");
          return res.data?.map((e) => TodayEntry.fromJson(e)).toList();
        },
        saveFetchResult: (data) => _db.insertTimeline(data));
  }

  @override
  Future<List<TodayEntry>> timelineCurrentMonth() {
    return resource<List<TodayEntry>, List<TodayEntry>>(
        query: () async => _db.getTimelineCurrentMonth(),
        shouldFetch: (cache) => cache == null || shouldFetch(),
        fetch: () async {
          Response<List> res = await _dio.get("/timeline-cases-all");
          return res.data?.map((e) => TodayEntry.fromJson(e)).toList();
        },
        saveFetchResult: (data) => _db.insertTimeline(data));
  }
}
