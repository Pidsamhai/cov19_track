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
        .get()
        .asStream();
  }

  Future<List<TodayEntry>> getTimelineWeekly() {
    return (select(today)
          ..limit(7)
          ..orderBy([
            (u) => OrderingTerm(expression: u.txnDate, mode: OrderingMode.desc),
          ]))
        .get();
  }

  Future<List<TodayEntry>> getTimelineCurrentYear() {
    var currentYear = DateTime.now().year;
    return (select(today)
          ..where((tbl) => tbl.txnDate.like("$currentYear%"))
          ..orderBy([
            (u) => OrderingTerm(expression: u.txnDate, mode: OrderingMode.desc),
          ]))
        .get();
  }

  Future<List<TodayEntry>> getTimelineCurrentMonth() {
    var currentYear = DateTime.now().year;
    var currentMonth = DateTime.now().month;

    // SELECT newCase, totalCase, newCaseExcludeabroad, totalCaseExcludeabroad, newDeath, totalDeath, newRecovered, totalRecovered, updateDate,
    //   strftime('%m', txnDate) as txnDate from today;

    // return customSelect('''
    //   SELECT
    //   txn_date,
    //   new_case,
    //   total_case,
    //   new_case_excludeabroad,
    //   total_case_excludeabroad,
    //   new_death,
    //   total_death,
    //   new_recovered,
    //   total_recovered,
    //   update_date FROM today
    //   GROUP BY txn_date
    //   ORDER BY txn_date DESC;
    //   ''', readsFrom: {today})
    //     .map((p0) => TodayEntry.fromData(p0.data, this))
    //     .get();

    // return customSelect(
    //   'SELECT *, (SELECT COUNT(*) FROM todos WHERE category = c.id) AS "amount" FROM categories c;',
    //   readsFrom: {todos, categories}, // used for the stream: the stream will update when either table changes
    //   ).watch().map((rows) {
    //     // we get list of rows here. We just have to turn the raw data from the row into a
    //     // CategoryWithCount. As we defined the Category table earlier, drift knows how to parse
    //     // a category. The only thing left to do manually is extracting the amount
    //     return rows
    //       .map((row) => CategoryWithCount(Category.fromData(row.data, this), row.readInt('amount')))
    //       .toList();

    return (select(today)
          ..where((tbl) => tbl.txnDate.like(
              "${currentYear}_${currentMonth.toString().padLeft(2, '0')}%"))
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
