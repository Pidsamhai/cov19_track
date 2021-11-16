import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

extension NumberFormating on int {
  String toCurrency() {
    var f = NumberFormat("###,###");
    return f.format(this);
  }
}

extension ContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);
}

extension StringExtensions on String {
  String dateFormat({String from = "yyyy-MM-dd", required String to}) {
    var dateTime = DateFormat(from).parse(this);
    return DateFormat(to).format(dateTime);
  }
}
