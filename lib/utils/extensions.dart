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