import 'package:moor_flutter/moor_flutter.dart';

extension ColumnExtensions<T> on ColumnBuilder<T> {
  ColumnBuilder<T> unique() {
    return customConstraint("UNIQUE");
  }
}
