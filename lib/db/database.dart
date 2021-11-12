import 'package:cov19_stats/model/province.dart';
import 'package:cov19_stats/model/timeline.dart';
import 'package:cov19_stats/model/today.dart';
import 'package:moor/moor.dart';

export 'package:cov19_stats/db/database/shared.dart';

part 'database.g.dart';

@UseMoor(tables: [Today, Timeline, Province])
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) {
        return m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {},
      beforeOpen: (details) async {},
    );
  }

  // Future<List<User>> getAllUsers() => select(users).get();
  // Future insertUser(User user) => into(users).insert(user);

  Stream<TodayEntry?> todayStream() {
    return (select(today)
          ..limit(1)
          ..orderBy([
            (u) => OrderingTerm(expression: u.txnDate, mode: OrderingMode.desc),
          ]))
        .watchSingleOrNull();
  }

  Stream<List<TodayEntry>> timelineStream(int limit) {
    return (select(today)
          ..limit(limit)
          ..orderBy([
            (u) => OrderingTerm(expression: u.txnDate, mode: OrderingMode.desc),
          ]))
        .get().asStream();
  }

    Future<List<TodayEntry>> getTimeline(int limit) {
    return (select(today)
          ..limit(limit)
          ..orderBy([
            (u) => OrderingTerm(expression: u.txnDate, mode: OrderingMode.desc),
          ]))
        .get();
  }

  Future insertToday(TodayEntry entry) =>
      into(today).insertOnConflictUpdate(entry);

  Future insertTimeline(List<TodayEntry> entries) async {
    // return transaction(() async {

    // });
    for (var entry in entries) {
      await into(today).insertOnConflictUpdate(entry);
    }
  }
}
