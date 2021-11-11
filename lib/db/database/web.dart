import 'package:cov19_stats/db/database.dart';
import 'package:moor/moor_web.dart';

AppDatabase openConnection({bool logStatements = false}) {
  return AppDatabase(WebDatabase('db', logStatements: logStatements));
}