import 'package:cov19_stats/model/today.dart';
import 'package:moor/moor.dart';

@DataClassName("ProvinceEntry")
class Province extends Today {
  @JsonKey("province")
  TextColumn get province => text()();

  @override
  Set<Column>? get primaryKey => { txnDate, province };
}
