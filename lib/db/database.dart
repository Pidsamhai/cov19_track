import 'dart:io';
import 'package:cov19_stats/model/province.dart';
import 'package:cov19_stats/model/timeline.dart';
import 'package:cov19_stats/model/today.dart';
import 'package:moor/ffi.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart' as paths;

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

  void insertToday(TodayEntry entry) => into(today).insertOnConflictUpdate(entry);
}

AppDatabase openConnection({bool logStatements = false}) {
  if (Platform.isIOS || Platform.isAndroid) {
    final executor = LazyDatabase(() async {
      final dataDir = await paths.getApplicationDocumentsDirectory();
      final dbFile = File(p.join(dataDir.path, 'db.sqlite'));
      return VmDatabase(dbFile, logStatements: logStatements);
    });
    return AppDatabase(executor);
  }
  return AppDatabase(VmDatabase.memory(logStatements: logStatements));
}
