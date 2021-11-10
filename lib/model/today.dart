import 'package:moor/moor.dart';

@DataClassName("TodayEntry")
class Today extends Table {
  @JsonKey("txn_date")
  TextColumn get txnDate => text()();
  @JsonKey("new_case")
  IntColumn get newCase => integer().nullable()();
  @JsonKey("total_case")
  IntColumn get totalCase => integer().nullable()();
  @JsonKey("new_case_excludeabroad")
  IntColumn get newCaseExcludeabroad => integer().nullable()();
  @JsonKey("total_case_excludeabroad")
  IntColumn get totalCaseExcludeabroad => integer().nullable()();
  @JsonKey("new_death")
  IntColumn get newDeath => integer().nullable()();
  @JsonKey("total_death")
  IntColumn get totalDeath => integer().nullable()();
  @JsonKey("new_recovered")
  IntColumn get newRecovered => integer().nullable()();
  @JsonKey("total_recovered")
  IntColumn get totalRecovered => integer().nullable()();
  @JsonKey("update_date")
  TextColumn get updateDate => text().nullable()();

  @override
  Set<Column>? get primaryKey => {txnDate};

  // static List<Today>? fromJsonArray(List? list) {
  //   return list?.map((e) => Today.fromJson(e)).toList();
  // }

  // static final TodayEntry fakeData = TodayEntry(
  //     txnDate: "2021-11-06",
  //     newCase: 8467,
  //     totalCase: 1960039,
  //     newCaseExcludeabroad: 8454,
  //     totalCaseExcludeabroad: 1953520,
  //     newDeath: 69,
  //     totalDeath: 19611,
  //     newRecovered: 8288,
  //     totalRecovered: 1843237,
  //     updateDate: "2021-11-06 07:31:10");
}
