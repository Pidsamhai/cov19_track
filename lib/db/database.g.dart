// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class TodayEntry extends DataClass implements Insertable<TodayEntry> {
  final String txnDate;
  final int? newCase;
  final int? totalCase;
  final int? newCaseExcludeabroad;
  final int? totalCaseExcludeabroad;
  final int? newDeath;
  final int? totalDeath;
  final int? newRecovered;
  final int? totalRecovered;
  final String? updateDate;
  TodayEntry(
      {required this.txnDate,
      this.newCase,
      this.totalCase,
      this.newCaseExcludeabroad,
      this.totalCaseExcludeabroad,
      this.newDeath,
      this.totalDeath,
      this.newRecovered,
      this.totalRecovered,
      this.updateDate});
  factory TodayEntry.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return TodayEntry(
      txnDate: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}txn_date'])!,
      newCase: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}new_case']),
      totalCase: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}total_case']),
      newCaseExcludeabroad: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}new_case_excludeabroad']),
      totalCaseExcludeabroad: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}total_case_excludeabroad']),
      newDeath: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}new_death']),
      totalDeath: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}total_death']),
      newRecovered: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}new_recovered']),
      totalRecovered: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}total_recovered']),
      updateDate: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}update_date']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['txn_date'] = Variable<String>(txnDate);
    if (!nullToAbsent || newCase != null) {
      map['new_case'] = Variable<int?>(newCase);
    }
    if (!nullToAbsent || totalCase != null) {
      map['total_case'] = Variable<int?>(totalCase);
    }
    if (!nullToAbsent || newCaseExcludeabroad != null) {
      map['new_case_excludeabroad'] = Variable<int?>(newCaseExcludeabroad);
    }
    if (!nullToAbsent || totalCaseExcludeabroad != null) {
      map['total_case_excludeabroad'] = Variable<int?>(totalCaseExcludeabroad);
    }
    if (!nullToAbsent || newDeath != null) {
      map['new_death'] = Variable<int?>(newDeath);
    }
    if (!nullToAbsent || totalDeath != null) {
      map['total_death'] = Variable<int?>(totalDeath);
    }
    if (!nullToAbsent || newRecovered != null) {
      map['new_recovered'] = Variable<int?>(newRecovered);
    }
    if (!nullToAbsent || totalRecovered != null) {
      map['total_recovered'] = Variable<int?>(totalRecovered);
    }
    if (!nullToAbsent || updateDate != null) {
      map['update_date'] = Variable<String?>(updateDate);
    }
    return map;
  }

  TodayCompanion toCompanion(bool nullToAbsent) {
    return TodayCompanion(
      txnDate: Value(txnDate),
      newCase: newCase == null && nullToAbsent
          ? const Value.absent()
          : Value(newCase),
      totalCase: totalCase == null && nullToAbsent
          ? const Value.absent()
          : Value(totalCase),
      newCaseExcludeabroad: newCaseExcludeabroad == null && nullToAbsent
          ? const Value.absent()
          : Value(newCaseExcludeabroad),
      totalCaseExcludeabroad: totalCaseExcludeabroad == null && nullToAbsent
          ? const Value.absent()
          : Value(totalCaseExcludeabroad),
      newDeath: newDeath == null && nullToAbsent
          ? const Value.absent()
          : Value(newDeath),
      totalDeath: totalDeath == null && nullToAbsent
          ? const Value.absent()
          : Value(totalDeath),
      newRecovered: newRecovered == null && nullToAbsent
          ? const Value.absent()
          : Value(newRecovered),
      totalRecovered: totalRecovered == null && nullToAbsent
          ? const Value.absent()
          : Value(totalRecovered),
      updateDate: updateDate == null && nullToAbsent
          ? const Value.absent()
          : Value(updateDate),
    );
  }

  factory TodayEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return TodayEntry(
      txnDate: serializer.fromJson<String>(json['txn_date']),
      newCase: serializer.fromJson<int?>(json['new_case']),
      totalCase: serializer.fromJson<int?>(json['total_case']),
      newCaseExcludeabroad:
          serializer.fromJson<int?>(json['new_case_excludeabroad']),
      totalCaseExcludeabroad:
          serializer.fromJson<int?>(json['total_case_excludeabroad']),
      newDeath: serializer.fromJson<int?>(json['new_death']),
      totalDeath: serializer.fromJson<int?>(json['total_death']),
      newRecovered: serializer.fromJson<int?>(json['new_recovered']),
      totalRecovered: serializer.fromJson<int?>(json['total_recovered']),
      updateDate: serializer.fromJson<String?>(json['update_date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'txn_date': serializer.toJson<String>(txnDate),
      'new_case': serializer.toJson<int?>(newCase),
      'total_case': serializer.toJson<int?>(totalCase),
      'new_case_excludeabroad': serializer.toJson<int?>(newCaseExcludeabroad),
      'total_case_excludeabroad':
          serializer.toJson<int?>(totalCaseExcludeabroad),
      'new_death': serializer.toJson<int?>(newDeath),
      'total_death': serializer.toJson<int?>(totalDeath),
      'new_recovered': serializer.toJson<int?>(newRecovered),
      'total_recovered': serializer.toJson<int?>(totalRecovered),
      'update_date': serializer.toJson<String?>(updateDate),
    };
  }

  TodayEntry copyWith(
          {String? txnDate,
          int? newCase,
          int? totalCase,
          int? newCaseExcludeabroad,
          int? totalCaseExcludeabroad,
          int? newDeath,
          int? totalDeath,
          int? newRecovered,
          int? totalRecovered,
          String? updateDate}) =>
      TodayEntry(
        txnDate: txnDate ?? this.txnDate,
        newCase: newCase ?? this.newCase,
        totalCase: totalCase ?? this.totalCase,
        newCaseExcludeabroad: newCaseExcludeabroad ?? this.newCaseExcludeabroad,
        totalCaseExcludeabroad:
            totalCaseExcludeabroad ?? this.totalCaseExcludeabroad,
        newDeath: newDeath ?? this.newDeath,
        totalDeath: totalDeath ?? this.totalDeath,
        newRecovered: newRecovered ?? this.newRecovered,
        totalRecovered: totalRecovered ?? this.totalRecovered,
        updateDate: updateDate ?? this.updateDate,
      );
  @override
  String toString() {
    return (StringBuffer('TodayEntry(')
          ..write('txnDate: $txnDate, ')
          ..write('newCase: $newCase, ')
          ..write('totalCase: $totalCase, ')
          ..write('newCaseExcludeabroad: $newCaseExcludeabroad, ')
          ..write('totalCaseExcludeabroad: $totalCaseExcludeabroad, ')
          ..write('newDeath: $newDeath, ')
          ..write('totalDeath: $totalDeath, ')
          ..write('newRecovered: $newRecovered, ')
          ..write('totalRecovered: $totalRecovered, ')
          ..write('updateDate: $updateDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      txnDate,
      newCase,
      totalCase,
      newCaseExcludeabroad,
      totalCaseExcludeabroad,
      newDeath,
      totalDeath,
      newRecovered,
      totalRecovered,
      updateDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TodayEntry &&
          other.txnDate == this.txnDate &&
          other.newCase == this.newCase &&
          other.totalCase == this.totalCase &&
          other.newCaseExcludeabroad == this.newCaseExcludeabroad &&
          other.totalCaseExcludeabroad == this.totalCaseExcludeabroad &&
          other.newDeath == this.newDeath &&
          other.totalDeath == this.totalDeath &&
          other.newRecovered == this.newRecovered &&
          other.totalRecovered == this.totalRecovered &&
          other.updateDate == this.updateDate);
}

class TodayCompanion extends UpdateCompanion<TodayEntry> {
  final Value<String> txnDate;
  final Value<int?> newCase;
  final Value<int?> totalCase;
  final Value<int?> newCaseExcludeabroad;
  final Value<int?> totalCaseExcludeabroad;
  final Value<int?> newDeath;
  final Value<int?> totalDeath;
  final Value<int?> newRecovered;
  final Value<int?> totalRecovered;
  final Value<String?> updateDate;
  const TodayCompanion({
    this.txnDate = const Value.absent(),
    this.newCase = const Value.absent(),
    this.totalCase = const Value.absent(),
    this.newCaseExcludeabroad = const Value.absent(),
    this.totalCaseExcludeabroad = const Value.absent(),
    this.newDeath = const Value.absent(),
    this.totalDeath = const Value.absent(),
    this.newRecovered = const Value.absent(),
    this.totalRecovered = const Value.absent(),
    this.updateDate = const Value.absent(),
  });
  TodayCompanion.insert({
    required String txnDate,
    this.newCase = const Value.absent(),
    this.totalCase = const Value.absent(),
    this.newCaseExcludeabroad = const Value.absent(),
    this.totalCaseExcludeabroad = const Value.absent(),
    this.newDeath = const Value.absent(),
    this.totalDeath = const Value.absent(),
    this.newRecovered = const Value.absent(),
    this.totalRecovered = const Value.absent(),
    this.updateDate = const Value.absent(),
  }) : txnDate = Value(txnDate);
  static Insertable<TodayEntry> custom({
    Expression<String>? txnDate,
    Expression<int?>? newCase,
    Expression<int?>? totalCase,
    Expression<int?>? newCaseExcludeabroad,
    Expression<int?>? totalCaseExcludeabroad,
    Expression<int?>? newDeath,
    Expression<int?>? totalDeath,
    Expression<int?>? newRecovered,
    Expression<int?>? totalRecovered,
    Expression<String?>? updateDate,
  }) {
    return RawValuesInsertable({
      if (txnDate != null) 'txn_date': txnDate,
      if (newCase != null) 'new_case': newCase,
      if (totalCase != null) 'total_case': totalCase,
      if (newCaseExcludeabroad != null)
        'new_case_excludeabroad': newCaseExcludeabroad,
      if (totalCaseExcludeabroad != null)
        'total_case_excludeabroad': totalCaseExcludeabroad,
      if (newDeath != null) 'new_death': newDeath,
      if (totalDeath != null) 'total_death': totalDeath,
      if (newRecovered != null) 'new_recovered': newRecovered,
      if (totalRecovered != null) 'total_recovered': totalRecovered,
      if (updateDate != null) 'update_date': updateDate,
    });
  }

  TodayCompanion copyWith(
      {Value<String>? txnDate,
      Value<int?>? newCase,
      Value<int?>? totalCase,
      Value<int?>? newCaseExcludeabroad,
      Value<int?>? totalCaseExcludeabroad,
      Value<int?>? newDeath,
      Value<int?>? totalDeath,
      Value<int?>? newRecovered,
      Value<int?>? totalRecovered,
      Value<String?>? updateDate}) {
    return TodayCompanion(
      txnDate: txnDate ?? this.txnDate,
      newCase: newCase ?? this.newCase,
      totalCase: totalCase ?? this.totalCase,
      newCaseExcludeabroad: newCaseExcludeabroad ?? this.newCaseExcludeabroad,
      totalCaseExcludeabroad:
          totalCaseExcludeabroad ?? this.totalCaseExcludeabroad,
      newDeath: newDeath ?? this.newDeath,
      totalDeath: totalDeath ?? this.totalDeath,
      newRecovered: newRecovered ?? this.newRecovered,
      totalRecovered: totalRecovered ?? this.totalRecovered,
      updateDate: updateDate ?? this.updateDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (txnDate.present) {
      map['txn_date'] = Variable<String>(txnDate.value);
    }
    if (newCase.present) {
      map['new_case'] = Variable<int?>(newCase.value);
    }
    if (totalCase.present) {
      map['total_case'] = Variable<int?>(totalCase.value);
    }
    if (newCaseExcludeabroad.present) {
      map['new_case_excludeabroad'] =
          Variable<int?>(newCaseExcludeabroad.value);
    }
    if (totalCaseExcludeabroad.present) {
      map['total_case_excludeabroad'] =
          Variable<int?>(totalCaseExcludeabroad.value);
    }
    if (newDeath.present) {
      map['new_death'] = Variable<int?>(newDeath.value);
    }
    if (totalDeath.present) {
      map['total_death'] = Variable<int?>(totalDeath.value);
    }
    if (newRecovered.present) {
      map['new_recovered'] = Variable<int?>(newRecovered.value);
    }
    if (totalRecovered.present) {
      map['total_recovered'] = Variable<int?>(totalRecovered.value);
    }
    if (updateDate.present) {
      map['update_date'] = Variable<String?>(updateDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodayCompanion(')
          ..write('txnDate: $txnDate, ')
          ..write('newCase: $newCase, ')
          ..write('totalCase: $totalCase, ')
          ..write('newCaseExcludeabroad: $newCaseExcludeabroad, ')
          ..write('totalCaseExcludeabroad: $totalCaseExcludeabroad, ')
          ..write('newDeath: $newDeath, ')
          ..write('totalDeath: $totalDeath, ')
          ..write('newRecovered: $newRecovered, ')
          ..write('totalRecovered: $totalRecovered, ')
          ..write('updateDate: $updateDate')
          ..write(')'))
        .toString();
  }
}

class $TodayTable extends Today with TableInfo<$TodayTable, TodayEntry> {
  final GeneratedDatabase _db;
  final String? _alias;
  $TodayTable(this._db, [this._alias]);
  final VerificationMeta _txnDateMeta = const VerificationMeta('txnDate');
  late final GeneratedColumn<String?> txnDate = GeneratedColumn<String?>(
      'txn_date', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _newCaseMeta = const VerificationMeta('newCase');
  late final GeneratedColumn<int?> newCase = GeneratedColumn<int?>(
      'new_case', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _totalCaseMeta = const VerificationMeta('totalCase');
  late final GeneratedColumn<int?> totalCase = GeneratedColumn<int?>(
      'total_case', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _newCaseExcludeabroadMeta =
      const VerificationMeta('newCaseExcludeabroad');
  late final GeneratedColumn<int?> newCaseExcludeabroad = GeneratedColumn<int?>(
      'new_case_excludeabroad', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _totalCaseExcludeabroadMeta =
      const VerificationMeta('totalCaseExcludeabroad');
  late final GeneratedColumn<int?> totalCaseExcludeabroad =
      GeneratedColumn<int?>('total_case_excludeabroad', aliasedName, true,
          typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _newDeathMeta = const VerificationMeta('newDeath');
  late final GeneratedColumn<int?> newDeath = GeneratedColumn<int?>(
      'new_death', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _totalDeathMeta = const VerificationMeta('totalDeath');
  late final GeneratedColumn<int?> totalDeath = GeneratedColumn<int?>(
      'total_death', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _newRecoveredMeta =
      const VerificationMeta('newRecovered');
  late final GeneratedColumn<int?> newRecovered = GeneratedColumn<int?>(
      'new_recovered', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _totalRecoveredMeta =
      const VerificationMeta('totalRecovered');
  late final GeneratedColumn<int?> totalRecovered = GeneratedColumn<int?>(
      'total_recovered', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _updateDateMeta = const VerificationMeta('updateDate');
  late final GeneratedColumn<String?> updateDate = GeneratedColumn<String?>(
      'update_date', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        txnDate,
        newCase,
        totalCase,
        newCaseExcludeabroad,
        totalCaseExcludeabroad,
        newDeath,
        totalDeath,
        newRecovered,
        totalRecovered,
        updateDate
      ];
  @override
  String get aliasedName => _alias ?? 'today';
  @override
  String get actualTableName => 'today';
  @override
  VerificationContext validateIntegrity(Insertable<TodayEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('txn_date')) {
      context.handle(_txnDateMeta,
          txnDate.isAcceptableOrUnknown(data['txn_date']!, _txnDateMeta));
    } else if (isInserting) {
      context.missing(_txnDateMeta);
    }
    if (data.containsKey('new_case')) {
      context.handle(_newCaseMeta,
          newCase.isAcceptableOrUnknown(data['new_case']!, _newCaseMeta));
    }
    if (data.containsKey('total_case')) {
      context.handle(_totalCaseMeta,
          totalCase.isAcceptableOrUnknown(data['total_case']!, _totalCaseMeta));
    }
    if (data.containsKey('new_case_excludeabroad')) {
      context.handle(
          _newCaseExcludeabroadMeta,
          newCaseExcludeabroad.isAcceptableOrUnknown(
              data['new_case_excludeabroad']!, _newCaseExcludeabroadMeta));
    }
    if (data.containsKey('total_case_excludeabroad')) {
      context.handle(
          _totalCaseExcludeabroadMeta,
          totalCaseExcludeabroad.isAcceptableOrUnknown(
              data['total_case_excludeabroad']!, _totalCaseExcludeabroadMeta));
    }
    if (data.containsKey('new_death')) {
      context.handle(_newDeathMeta,
          newDeath.isAcceptableOrUnknown(data['new_death']!, _newDeathMeta));
    }
    if (data.containsKey('total_death')) {
      context.handle(
          _totalDeathMeta,
          totalDeath.isAcceptableOrUnknown(
              data['total_death']!, _totalDeathMeta));
    }
    if (data.containsKey('new_recovered')) {
      context.handle(
          _newRecoveredMeta,
          newRecovered.isAcceptableOrUnknown(
              data['new_recovered']!, _newRecoveredMeta));
    }
    if (data.containsKey('total_recovered')) {
      context.handle(
          _totalRecoveredMeta,
          totalRecovered.isAcceptableOrUnknown(
              data['total_recovered']!, _totalRecoveredMeta));
    }
    if (data.containsKey('update_date')) {
      context.handle(
          _updateDateMeta,
          updateDate.isAcceptableOrUnknown(
              data['update_date']!, _updateDateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {txnDate};
  @override
  TodayEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    return TodayEntry.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TodayTable createAlias(String alias) {
    return $TodayTable(_db, alias);
  }
}

class TimelineEntry extends DataClass implements Insertable<TimelineEntry> {
  final String txnDate;
  final int? newCase;
  final int? totalCase;
  final int? newCaseExcludeabroad;
  final int? totalCaseExcludeabroad;
  final int? newDeath;
  final int? totalDeath;
  final int? newRecovered;
  final int? totalRecovered;
  final String? updateDate;
  TimelineEntry(
      {required this.txnDate,
      this.newCase,
      this.totalCase,
      this.newCaseExcludeabroad,
      this.totalCaseExcludeabroad,
      this.newDeath,
      this.totalDeath,
      this.newRecovered,
      this.totalRecovered,
      this.updateDate});
  factory TimelineEntry.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return TimelineEntry(
      txnDate: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}txn_date'])!,
      newCase: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}new_case']),
      totalCase: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}total_case']),
      newCaseExcludeabroad: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}new_case_excludeabroad']),
      totalCaseExcludeabroad: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}total_case_excludeabroad']),
      newDeath: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}new_death']),
      totalDeath: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}total_death']),
      newRecovered: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}new_recovered']),
      totalRecovered: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}total_recovered']),
      updateDate: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}update_date']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['txn_date'] = Variable<String>(txnDate);
    if (!nullToAbsent || newCase != null) {
      map['new_case'] = Variable<int?>(newCase);
    }
    if (!nullToAbsent || totalCase != null) {
      map['total_case'] = Variable<int?>(totalCase);
    }
    if (!nullToAbsent || newCaseExcludeabroad != null) {
      map['new_case_excludeabroad'] = Variable<int?>(newCaseExcludeabroad);
    }
    if (!nullToAbsent || totalCaseExcludeabroad != null) {
      map['total_case_excludeabroad'] = Variable<int?>(totalCaseExcludeabroad);
    }
    if (!nullToAbsent || newDeath != null) {
      map['new_death'] = Variable<int?>(newDeath);
    }
    if (!nullToAbsent || totalDeath != null) {
      map['total_death'] = Variable<int?>(totalDeath);
    }
    if (!nullToAbsent || newRecovered != null) {
      map['new_recovered'] = Variable<int?>(newRecovered);
    }
    if (!nullToAbsent || totalRecovered != null) {
      map['total_recovered'] = Variable<int?>(totalRecovered);
    }
    if (!nullToAbsent || updateDate != null) {
      map['update_date'] = Variable<String?>(updateDate);
    }
    return map;
  }

  TimelineCompanion toCompanion(bool nullToAbsent) {
    return TimelineCompanion(
      txnDate: Value(txnDate),
      newCase: newCase == null && nullToAbsent
          ? const Value.absent()
          : Value(newCase),
      totalCase: totalCase == null && nullToAbsent
          ? const Value.absent()
          : Value(totalCase),
      newCaseExcludeabroad: newCaseExcludeabroad == null && nullToAbsent
          ? const Value.absent()
          : Value(newCaseExcludeabroad),
      totalCaseExcludeabroad: totalCaseExcludeabroad == null && nullToAbsent
          ? const Value.absent()
          : Value(totalCaseExcludeabroad),
      newDeath: newDeath == null && nullToAbsent
          ? const Value.absent()
          : Value(newDeath),
      totalDeath: totalDeath == null && nullToAbsent
          ? const Value.absent()
          : Value(totalDeath),
      newRecovered: newRecovered == null && nullToAbsent
          ? const Value.absent()
          : Value(newRecovered),
      totalRecovered: totalRecovered == null && nullToAbsent
          ? const Value.absent()
          : Value(totalRecovered),
      updateDate: updateDate == null && nullToAbsent
          ? const Value.absent()
          : Value(updateDate),
    );
  }

  factory TimelineEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return TimelineEntry(
      txnDate: serializer.fromJson<String>(json['txn_date']),
      newCase: serializer.fromJson<int?>(json['new_case']),
      totalCase: serializer.fromJson<int?>(json['total_case']),
      newCaseExcludeabroad:
          serializer.fromJson<int?>(json['new_case_excludeabroad']),
      totalCaseExcludeabroad:
          serializer.fromJson<int?>(json['total_case_excludeabroad']),
      newDeath: serializer.fromJson<int?>(json['new_death']),
      totalDeath: serializer.fromJson<int?>(json['total_death']),
      newRecovered: serializer.fromJson<int?>(json['new_recovered']),
      totalRecovered: serializer.fromJson<int?>(json['total_recovered']),
      updateDate: serializer.fromJson<String?>(json['update_date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'txn_date': serializer.toJson<String>(txnDate),
      'new_case': serializer.toJson<int?>(newCase),
      'total_case': serializer.toJson<int?>(totalCase),
      'new_case_excludeabroad': serializer.toJson<int?>(newCaseExcludeabroad),
      'total_case_excludeabroad':
          serializer.toJson<int?>(totalCaseExcludeabroad),
      'new_death': serializer.toJson<int?>(newDeath),
      'total_death': serializer.toJson<int?>(totalDeath),
      'new_recovered': serializer.toJson<int?>(newRecovered),
      'total_recovered': serializer.toJson<int?>(totalRecovered),
      'update_date': serializer.toJson<String?>(updateDate),
    };
  }

  TimelineEntry copyWith(
          {String? txnDate,
          int? newCase,
          int? totalCase,
          int? newCaseExcludeabroad,
          int? totalCaseExcludeabroad,
          int? newDeath,
          int? totalDeath,
          int? newRecovered,
          int? totalRecovered,
          String? updateDate}) =>
      TimelineEntry(
        txnDate: txnDate ?? this.txnDate,
        newCase: newCase ?? this.newCase,
        totalCase: totalCase ?? this.totalCase,
        newCaseExcludeabroad: newCaseExcludeabroad ?? this.newCaseExcludeabroad,
        totalCaseExcludeabroad:
            totalCaseExcludeabroad ?? this.totalCaseExcludeabroad,
        newDeath: newDeath ?? this.newDeath,
        totalDeath: totalDeath ?? this.totalDeath,
        newRecovered: newRecovered ?? this.newRecovered,
        totalRecovered: totalRecovered ?? this.totalRecovered,
        updateDate: updateDate ?? this.updateDate,
      );
  @override
  String toString() {
    return (StringBuffer('TimelineEntry(')
          ..write('txnDate: $txnDate, ')
          ..write('newCase: $newCase, ')
          ..write('totalCase: $totalCase, ')
          ..write('newCaseExcludeabroad: $newCaseExcludeabroad, ')
          ..write('totalCaseExcludeabroad: $totalCaseExcludeabroad, ')
          ..write('newDeath: $newDeath, ')
          ..write('totalDeath: $totalDeath, ')
          ..write('newRecovered: $newRecovered, ')
          ..write('totalRecovered: $totalRecovered, ')
          ..write('updateDate: $updateDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      txnDate,
      newCase,
      totalCase,
      newCaseExcludeabroad,
      totalCaseExcludeabroad,
      newDeath,
      totalDeath,
      newRecovered,
      totalRecovered,
      updateDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TimelineEntry &&
          other.txnDate == this.txnDate &&
          other.newCase == this.newCase &&
          other.totalCase == this.totalCase &&
          other.newCaseExcludeabroad == this.newCaseExcludeabroad &&
          other.totalCaseExcludeabroad == this.totalCaseExcludeabroad &&
          other.newDeath == this.newDeath &&
          other.totalDeath == this.totalDeath &&
          other.newRecovered == this.newRecovered &&
          other.totalRecovered == this.totalRecovered &&
          other.updateDate == this.updateDate);
}

class TimelineCompanion extends UpdateCompanion<TimelineEntry> {
  final Value<String> txnDate;
  final Value<int?> newCase;
  final Value<int?> totalCase;
  final Value<int?> newCaseExcludeabroad;
  final Value<int?> totalCaseExcludeabroad;
  final Value<int?> newDeath;
  final Value<int?> totalDeath;
  final Value<int?> newRecovered;
  final Value<int?> totalRecovered;
  final Value<String?> updateDate;
  const TimelineCompanion({
    this.txnDate = const Value.absent(),
    this.newCase = const Value.absent(),
    this.totalCase = const Value.absent(),
    this.newCaseExcludeabroad = const Value.absent(),
    this.totalCaseExcludeabroad = const Value.absent(),
    this.newDeath = const Value.absent(),
    this.totalDeath = const Value.absent(),
    this.newRecovered = const Value.absent(),
    this.totalRecovered = const Value.absent(),
    this.updateDate = const Value.absent(),
  });
  TimelineCompanion.insert({
    required String txnDate,
    this.newCase = const Value.absent(),
    this.totalCase = const Value.absent(),
    this.newCaseExcludeabroad = const Value.absent(),
    this.totalCaseExcludeabroad = const Value.absent(),
    this.newDeath = const Value.absent(),
    this.totalDeath = const Value.absent(),
    this.newRecovered = const Value.absent(),
    this.totalRecovered = const Value.absent(),
    this.updateDate = const Value.absent(),
  }) : txnDate = Value(txnDate);
  static Insertable<TimelineEntry> custom({
    Expression<String>? txnDate,
    Expression<int?>? newCase,
    Expression<int?>? totalCase,
    Expression<int?>? newCaseExcludeabroad,
    Expression<int?>? totalCaseExcludeabroad,
    Expression<int?>? newDeath,
    Expression<int?>? totalDeath,
    Expression<int?>? newRecovered,
    Expression<int?>? totalRecovered,
    Expression<String?>? updateDate,
  }) {
    return RawValuesInsertable({
      if (txnDate != null) 'txn_date': txnDate,
      if (newCase != null) 'new_case': newCase,
      if (totalCase != null) 'total_case': totalCase,
      if (newCaseExcludeabroad != null)
        'new_case_excludeabroad': newCaseExcludeabroad,
      if (totalCaseExcludeabroad != null)
        'total_case_excludeabroad': totalCaseExcludeabroad,
      if (newDeath != null) 'new_death': newDeath,
      if (totalDeath != null) 'total_death': totalDeath,
      if (newRecovered != null) 'new_recovered': newRecovered,
      if (totalRecovered != null) 'total_recovered': totalRecovered,
      if (updateDate != null) 'update_date': updateDate,
    });
  }

  TimelineCompanion copyWith(
      {Value<String>? txnDate,
      Value<int?>? newCase,
      Value<int?>? totalCase,
      Value<int?>? newCaseExcludeabroad,
      Value<int?>? totalCaseExcludeabroad,
      Value<int?>? newDeath,
      Value<int?>? totalDeath,
      Value<int?>? newRecovered,
      Value<int?>? totalRecovered,
      Value<String?>? updateDate}) {
    return TimelineCompanion(
      txnDate: txnDate ?? this.txnDate,
      newCase: newCase ?? this.newCase,
      totalCase: totalCase ?? this.totalCase,
      newCaseExcludeabroad: newCaseExcludeabroad ?? this.newCaseExcludeabroad,
      totalCaseExcludeabroad:
          totalCaseExcludeabroad ?? this.totalCaseExcludeabroad,
      newDeath: newDeath ?? this.newDeath,
      totalDeath: totalDeath ?? this.totalDeath,
      newRecovered: newRecovered ?? this.newRecovered,
      totalRecovered: totalRecovered ?? this.totalRecovered,
      updateDate: updateDate ?? this.updateDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (txnDate.present) {
      map['txn_date'] = Variable<String>(txnDate.value);
    }
    if (newCase.present) {
      map['new_case'] = Variable<int?>(newCase.value);
    }
    if (totalCase.present) {
      map['total_case'] = Variable<int?>(totalCase.value);
    }
    if (newCaseExcludeabroad.present) {
      map['new_case_excludeabroad'] =
          Variable<int?>(newCaseExcludeabroad.value);
    }
    if (totalCaseExcludeabroad.present) {
      map['total_case_excludeabroad'] =
          Variable<int?>(totalCaseExcludeabroad.value);
    }
    if (newDeath.present) {
      map['new_death'] = Variable<int?>(newDeath.value);
    }
    if (totalDeath.present) {
      map['total_death'] = Variable<int?>(totalDeath.value);
    }
    if (newRecovered.present) {
      map['new_recovered'] = Variable<int?>(newRecovered.value);
    }
    if (totalRecovered.present) {
      map['total_recovered'] = Variable<int?>(totalRecovered.value);
    }
    if (updateDate.present) {
      map['update_date'] = Variable<String?>(updateDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TimelineCompanion(')
          ..write('txnDate: $txnDate, ')
          ..write('newCase: $newCase, ')
          ..write('totalCase: $totalCase, ')
          ..write('newCaseExcludeabroad: $newCaseExcludeabroad, ')
          ..write('totalCaseExcludeabroad: $totalCaseExcludeabroad, ')
          ..write('newDeath: $newDeath, ')
          ..write('totalDeath: $totalDeath, ')
          ..write('newRecovered: $newRecovered, ')
          ..write('totalRecovered: $totalRecovered, ')
          ..write('updateDate: $updateDate')
          ..write(')'))
        .toString();
  }
}

class $TimelineTable extends Timeline
    with TableInfo<$TimelineTable, TimelineEntry> {
  final GeneratedDatabase _db;
  final String? _alias;
  $TimelineTable(this._db, [this._alias]);
  final VerificationMeta _txnDateMeta = const VerificationMeta('txnDate');
  late final GeneratedColumn<String?> txnDate = GeneratedColumn<String?>(
      'txn_date', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _newCaseMeta = const VerificationMeta('newCase');
  late final GeneratedColumn<int?> newCase = GeneratedColumn<int?>(
      'new_case', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _totalCaseMeta = const VerificationMeta('totalCase');
  late final GeneratedColumn<int?> totalCase = GeneratedColumn<int?>(
      'total_case', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _newCaseExcludeabroadMeta =
      const VerificationMeta('newCaseExcludeabroad');
  late final GeneratedColumn<int?> newCaseExcludeabroad = GeneratedColumn<int?>(
      'new_case_excludeabroad', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _totalCaseExcludeabroadMeta =
      const VerificationMeta('totalCaseExcludeabroad');
  late final GeneratedColumn<int?> totalCaseExcludeabroad =
      GeneratedColumn<int?>('total_case_excludeabroad', aliasedName, true,
          typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _newDeathMeta = const VerificationMeta('newDeath');
  late final GeneratedColumn<int?> newDeath = GeneratedColumn<int?>(
      'new_death', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _totalDeathMeta = const VerificationMeta('totalDeath');
  late final GeneratedColumn<int?> totalDeath = GeneratedColumn<int?>(
      'total_death', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _newRecoveredMeta =
      const VerificationMeta('newRecovered');
  late final GeneratedColumn<int?> newRecovered = GeneratedColumn<int?>(
      'new_recovered', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _totalRecoveredMeta =
      const VerificationMeta('totalRecovered');
  late final GeneratedColumn<int?> totalRecovered = GeneratedColumn<int?>(
      'total_recovered', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _updateDateMeta = const VerificationMeta('updateDate');
  late final GeneratedColumn<String?> updateDate = GeneratedColumn<String?>(
      'update_date', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        txnDate,
        newCase,
        totalCase,
        newCaseExcludeabroad,
        totalCaseExcludeabroad,
        newDeath,
        totalDeath,
        newRecovered,
        totalRecovered,
        updateDate
      ];
  @override
  String get aliasedName => _alias ?? 'timeline';
  @override
  String get actualTableName => 'timeline';
  @override
  VerificationContext validateIntegrity(Insertable<TimelineEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('txn_date')) {
      context.handle(_txnDateMeta,
          txnDate.isAcceptableOrUnknown(data['txn_date']!, _txnDateMeta));
    } else if (isInserting) {
      context.missing(_txnDateMeta);
    }
    if (data.containsKey('new_case')) {
      context.handle(_newCaseMeta,
          newCase.isAcceptableOrUnknown(data['new_case']!, _newCaseMeta));
    }
    if (data.containsKey('total_case')) {
      context.handle(_totalCaseMeta,
          totalCase.isAcceptableOrUnknown(data['total_case']!, _totalCaseMeta));
    }
    if (data.containsKey('new_case_excludeabroad')) {
      context.handle(
          _newCaseExcludeabroadMeta,
          newCaseExcludeabroad.isAcceptableOrUnknown(
              data['new_case_excludeabroad']!, _newCaseExcludeabroadMeta));
    }
    if (data.containsKey('total_case_excludeabroad')) {
      context.handle(
          _totalCaseExcludeabroadMeta,
          totalCaseExcludeabroad.isAcceptableOrUnknown(
              data['total_case_excludeabroad']!, _totalCaseExcludeabroadMeta));
    }
    if (data.containsKey('new_death')) {
      context.handle(_newDeathMeta,
          newDeath.isAcceptableOrUnknown(data['new_death']!, _newDeathMeta));
    }
    if (data.containsKey('total_death')) {
      context.handle(
          _totalDeathMeta,
          totalDeath.isAcceptableOrUnknown(
              data['total_death']!, _totalDeathMeta));
    }
    if (data.containsKey('new_recovered')) {
      context.handle(
          _newRecoveredMeta,
          newRecovered.isAcceptableOrUnknown(
              data['new_recovered']!, _newRecoveredMeta));
    }
    if (data.containsKey('total_recovered')) {
      context.handle(
          _totalRecoveredMeta,
          totalRecovered.isAcceptableOrUnknown(
              data['total_recovered']!, _totalRecoveredMeta));
    }
    if (data.containsKey('update_date')) {
      context.handle(
          _updateDateMeta,
          updateDate.isAcceptableOrUnknown(
              data['update_date']!, _updateDateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {txnDate};
  @override
  TimelineEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    return TimelineEntry.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TimelineTable createAlias(String alias) {
    return $TimelineTable(_db, alias);
  }
}

class ProvinceEntry extends DataClass implements Insertable<ProvinceEntry> {
  final String txnDate;
  final int? newCase;
  final int? totalCase;
  final int? newCaseExcludeabroad;
  final int? totalCaseExcludeabroad;
  final int? newDeath;
  final int? totalDeath;
  final int? newRecovered;
  final int? totalRecovered;
  final String? updateDate;
  final String province;
  ProvinceEntry(
      {required this.txnDate,
      this.newCase,
      this.totalCase,
      this.newCaseExcludeabroad,
      this.totalCaseExcludeabroad,
      this.newDeath,
      this.totalDeath,
      this.newRecovered,
      this.totalRecovered,
      this.updateDate,
      required this.province});
  factory ProvinceEntry.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ProvinceEntry(
      txnDate: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}txn_date'])!,
      newCase: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}new_case']),
      totalCase: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}total_case']),
      newCaseExcludeabroad: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}new_case_excludeabroad']),
      totalCaseExcludeabroad: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}total_case_excludeabroad']),
      newDeath: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}new_death']),
      totalDeath: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}total_death']),
      newRecovered: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}new_recovered']),
      totalRecovered: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}total_recovered']),
      updateDate: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}update_date']),
      province: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}province'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['txn_date'] = Variable<String>(txnDate);
    if (!nullToAbsent || newCase != null) {
      map['new_case'] = Variable<int?>(newCase);
    }
    if (!nullToAbsent || totalCase != null) {
      map['total_case'] = Variable<int?>(totalCase);
    }
    if (!nullToAbsent || newCaseExcludeabroad != null) {
      map['new_case_excludeabroad'] = Variable<int?>(newCaseExcludeabroad);
    }
    if (!nullToAbsent || totalCaseExcludeabroad != null) {
      map['total_case_excludeabroad'] = Variable<int?>(totalCaseExcludeabroad);
    }
    if (!nullToAbsent || newDeath != null) {
      map['new_death'] = Variable<int?>(newDeath);
    }
    if (!nullToAbsent || totalDeath != null) {
      map['total_death'] = Variable<int?>(totalDeath);
    }
    if (!nullToAbsent || newRecovered != null) {
      map['new_recovered'] = Variable<int?>(newRecovered);
    }
    if (!nullToAbsent || totalRecovered != null) {
      map['total_recovered'] = Variable<int?>(totalRecovered);
    }
    if (!nullToAbsent || updateDate != null) {
      map['update_date'] = Variable<String?>(updateDate);
    }
    map['province'] = Variable<String>(province);
    return map;
  }

  ProvinceCompanion toCompanion(bool nullToAbsent) {
    return ProvinceCompanion(
      txnDate: Value(txnDate),
      newCase: newCase == null && nullToAbsent
          ? const Value.absent()
          : Value(newCase),
      totalCase: totalCase == null && nullToAbsent
          ? const Value.absent()
          : Value(totalCase),
      newCaseExcludeabroad: newCaseExcludeabroad == null && nullToAbsent
          ? const Value.absent()
          : Value(newCaseExcludeabroad),
      totalCaseExcludeabroad: totalCaseExcludeabroad == null && nullToAbsent
          ? const Value.absent()
          : Value(totalCaseExcludeabroad),
      newDeath: newDeath == null && nullToAbsent
          ? const Value.absent()
          : Value(newDeath),
      totalDeath: totalDeath == null && nullToAbsent
          ? const Value.absent()
          : Value(totalDeath),
      newRecovered: newRecovered == null && nullToAbsent
          ? const Value.absent()
          : Value(newRecovered),
      totalRecovered: totalRecovered == null && nullToAbsent
          ? const Value.absent()
          : Value(totalRecovered),
      updateDate: updateDate == null && nullToAbsent
          ? const Value.absent()
          : Value(updateDate),
      province: Value(province),
    );
  }

  factory ProvinceEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ProvinceEntry(
      txnDate: serializer.fromJson<String>(json['txn_date']),
      newCase: serializer.fromJson<int?>(json['new_case']),
      totalCase: serializer.fromJson<int?>(json['total_case']),
      newCaseExcludeabroad:
          serializer.fromJson<int?>(json['new_case_excludeabroad']),
      totalCaseExcludeabroad:
          serializer.fromJson<int?>(json['total_case_excludeabroad']),
      newDeath: serializer.fromJson<int?>(json['new_death']),
      totalDeath: serializer.fromJson<int?>(json['total_death']),
      newRecovered: serializer.fromJson<int?>(json['new_recovered']),
      totalRecovered: serializer.fromJson<int?>(json['total_recovered']),
      updateDate: serializer.fromJson<String?>(json['update_date']),
      province: serializer.fromJson<String>(json['province']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'txn_date': serializer.toJson<String>(txnDate),
      'new_case': serializer.toJson<int?>(newCase),
      'total_case': serializer.toJson<int?>(totalCase),
      'new_case_excludeabroad': serializer.toJson<int?>(newCaseExcludeabroad),
      'total_case_excludeabroad':
          serializer.toJson<int?>(totalCaseExcludeabroad),
      'new_death': serializer.toJson<int?>(newDeath),
      'total_death': serializer.toJson<int?>(totalDeath),
      'new_recovered': serializer.toJson<int?>(newRecovered),
      'total_recovered': serializer.toJson<int?>(totalRecovered),
      'update_date': serializer.toJson<String?>(updateDate),
      'province': serializer.toJson<String>(province),
    };
  }

  ProvinceEntry copyWith(
          {String? txnDate,
          int? newCase,
          int? totalCase,
          int? newCaseExcludeabroad,
          int? totalCaseExcludeabroad,
          int? newDeath,
          int? totalDeath,
          int? newRecovered,
          int? totalRecovered,
          String? updateDate,
          String? province}) =>
      ProvinceEntry(
        txnDate: txnDate ?? this.txnDate,
        newCase: newCase ?? this.newCase,
        totalCase: totalCase ?? this.totalCase,
        newCaseExcludeabroad: newCaseExcludeabroad ?? this.newCaseExcludeabroad,
        totalCaseExcludeabroad:
            totalCaseExcludeabroad ?? this.totalCaseExcludeabroad,
        newDeath: newDeath ?? this.newDeath,
        totalDeath: totalDeath ?? this.totalDeath,
        newRecovered: newRecovered ?? this.newRecovered,
        totalRecovered: totalRecovered ?? this.totalRecovered,
        updateDate: updateDate ?? this.updateDate,
        province: province ?? this.province,
      );
  @override
  String toString() {
    return (StringBuffer('ProvinceEntry(')
          ..write('txnDate: $txnDate, ')
          ..write('newCase: $newCase, ')
          ..write('totalCase: $totalCase, ')
          ..write('newCaseExcludeabroad: $newCaseExcludeabroad, ')
          ..write('totalCaseExcludeabroad: $totalCaseExcludeabroad, ')
          ..write('newDeath: $newDeath, ')
          ..write('totalDeath: $totalDeath, ')
          ..write('newRecovered: $newRecovered, ')
          ..write('totalRecovered: $totalRecovered, ')
          ..write('updateDate: $updateDate, ')
          ..write('province: $province')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      txnDate,
      newCase,
      totalCase,
      newCaseExcludeabroad,
      totalCaseExcludeabroad,
      newDeath,
      totalDeath,
      newRecovered,
      totalRecovered,
      updateDate,
      province);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProvinceEntry &&
          other.txnDate == this.txnDate &&
          other.newCase == this.newCase &&
          other.totalCase == this.totalCase &&
          other.newCaseExcludeabroad == this.newCaseExcludeabroad &&
          other.totalCaseExcludeabroad == this.totalCaseExcludeabroad &&
          other.newDeath == this.newDeath &&
          other.totalDeath == this.totalDeath &&
          other.newRecovered == this.newRecovered &&
          other.totalRecovered == this.totalRecovered &&
          other.updateDate == this.updateDate &&
          other.province == this.province);
}

class ProvinceCompanion extends UpdateCompanion<ProvinceEntry> {
  final Value<String> txnDate;
  final Value<int?> newCase;
  final Value<int?> totalCase;
  final Value<int?> newCaseExcludeabroad;
  final Value<int?> totalCaseExcludeabroad;
  final Value<int?> newDeath;
  final Value<int?> totalDeath;
  final Value<int?> newRecovered;
  final Value<int?> totalRecovered;
  final Value<String?> updateDate;
  final Value<String> province;
  const ProvinceCompanion({
    this.txnDate = const Value.absent(),
    this.newCase = const Value.absent(),
    this.totalCase = const Value.absent(),
    this.newCaseExcludeabroad = const Value.absent(),
    this.totalCaseExcludeabroad = const Value.absent(),
    this.newDeath = const Value.absent(),
    this.totalDeath = const Value.absent(),
    this.newRecovered = const Value.absent(),
    this.totalRecovered = const Value.absent(),
    this.updateDate = const Value.absent(),
    this.province = const Value.absent(),
  });
  ProvinceCompanion.insert({
    required String txnDate,
    this.newCase = const Value.absent(),
    this.totalCase = const Value.absent(),
    this.newCaseExcludeabroad = const Value.absent(),
    this.totalCaseExcludeabroad = const Value.absent(),
    this.newDeath = const Value.absent(),
    this.totalDeath = const Value.absent(),
    this.newRecovered = const Value.absent(),
    this.totalRecovered = const Value.absent(),
    this.updateDate = const Value.absent(),
    required String province,
  })  : txnDate = Value(txnDate),
        province = Value(province);
  static Insertable<ProvinceEntry> custom({
    Expression<String>? txnDate,
    Expression<int?>? newCase,
    Expression<int?>? totalCase,
    Expression<int?>? newCaseExcludeabroad,
    Expression<int?>? totalCaseExcludeabroad,
    Expression<int?>? newDeath,
    Expression<int?>? totalDeath,
    Expression<int?>? newRecovered,
    Expression<int?>? totalRecovered,
    Expression<String?>? updateDate,
    Expression<String>? province,
  }) {
    return RawValuesInsertable({
      if (txnDate != null) 'txn_date': txnDate,
      if (newCase != null) 'new_case': newCase,
      if (totalCase != null) 'total_case': totalCase,
      if (newCaseExcludeabroad != null)
        'new_case_excludeabroad': newCaseExcludeabroad,
      if (totalCaseExcludeabroad != null)
        'total_case_excludeabroad': totalCaseExcludeabroad,
      if (newDeath != null) 'new_death': newDeath,
      if (totalDeath != null) 'total_death': totalDeath,
      if (newRecovered != null) 'new_recovered': newRecovered,
      if (totalRecovered != null) 'total_recovered': totalRecovered,
      if (updateDate != null) 'update_date': updateDate,
      if (province != null) 'province': province,
    });
  }

  ProvinceCompanion copyWith(
      {Value<String>? txnDate,
      Value<int?>? newCase,
      Value<int?>? totalCase,
      Value<int?>? newCaseExcludeabroad,
      Value<int?>? totalCaseExcludeabroad,
      Value<int?>? newDeath,
      Value<int?>? totalDeath,
      Value<int?>? newRecovered,
      Value<int?>? totalRecovered,
      Value<String?>? updateDate,
      Value<String>? province}) {
    return ProvinceCompanion(
      txnDate: txnDate ?? this.txnDate,
      newCase: newCase ?? this.newCase,
      totalCase: totalCase ?? this.totalCase,
      newCaseExcludeabroad: newCaseExcludeabroad ?? this.newCaseExcludeabroad,
      totalCaseExcludeabroad:
          totalCaseExcludeabroad ?? this.totalCaseExcludeabroad,
      newDeath: newDeath ?? this.newDeath,
      totalDeath: totalDeath ?? this.totalDeath,
      newRecovered: newRecovered ?? this.newRecovered,
      totalRecovered: totalRecovered ?? this.totalRecovered,
      updateDate: updateDate ?? this.updateDate,
      province: province ?? this.province,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (txnDate.present) {
      map['txn_date'] = Variable<String>(txnDate.value);
    }
    if (newCase.present) {
      map['new_case'] = Variable<int?>(newCase.value);
    }
    if (totalCase.present) {
      map['total_case'] = Variable<int?>(totalCase.value);
    }
    if (newCaseExcludeabroad.present) {
      map['new_case_excludeabroad'] =
          Variable<int?>(newCaseExcludeabroad.value);
    }
    if (totalCaseExcludeabroad.present) {
      map['total_case_excludeabroad'] =
          Variable<int?>(totalCaseExcludeabroad.value);
    }
    if (newDeath.present) {
      map['new_death'] = Variable<int?>(newDeath.value);
    }
    if (totalDeath.present) {
      map['total_death'] = Variable<int?>(totalDeath.value);
    }
    if (newRecovered.present) {
      map['new_recovered'] = Variable<int?>(newRecovered.value);
    }
    if (totalRecovered.present) {
      map['total_recovered'] = Variable<int?>(totalRecovered.value);
    }
    if (updateDate.present) {
      map['update_date'] = Variable<String?>(updateDate.value);
    }
    if (province.present) {
      map['province'] = Variable<String>(province.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProvinceCompanion(')
          ..write('txnDate: $txnDate, ')
          ..write('newCase: $newCase, ')
          ..write('totalCase: $totalCase, ')
          ..write('newCaseExcludeabroad: $newCaseExcludeabroad, ')
          ..write('totalCaseExcludeabroad: $totalCaseExcludeabroad, ')
          ..write('newDeath: $newDeath, ')
          ..write('totalDeath: $totalDeath, ')
          ..write('newRecovered: $newRecovered, ')
          ..write('totalRecovered: $totalRecovered, ')
          ..write('updateDate: $updateDate, ')
          ..write('province: $province')
          ..write(')'))
        .toString();
  }
}

class $ProvinceTable extends Province
    with TableInfo<$ProvinceTable, ProvinceEntry> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ProvinceTable(this._db, [this._alias]);
  final VerificationMeta _txnDateMeta = const VerificationMeta('txnDate');
  late final GeneratedColumn<String?> txnDate = GeneratedColumn<String?>(
      'txn_date', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _newCaseMeta = const VerificationMeta('newCase');
  late final GeneratedColumn<int?> newCase = GeneratedColumn<int?>(
      'new_case', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _totalCaseMeta = const VerificationMeta('totalCase');
  late final GeneratedColumn<int?> totalCase = GeneratedColumn<int?>(
      'total_case', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _newCaseExcludeabroadMeta =
      const VerificationMeta('newCaseExcludeabroad');
  late final GeneratedColumn<int?> newCaseExcludeabroad = GeneratedColumn<int?>(
      'new_case_excludeabroad', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _totalCaseExcludeabroadMeta =
      const VerificationMeta('totalCaseExcludeabroad');
  late final GeneratedColumn<int?> totalCaseExcludeabroad =
      GeneratedColumn<int?>('total_case_excludeabroad', aliasedName, true,
          typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _newDeathMeta = const VerificationMeta('newDeath');
  late final GeneratedColumn<int?> newDeath = GeneratedColumn<int?>(
      'new_death', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _totalDeathMeta = const VerificationMeta('totalDeath');
  late final GeneratedColumn<int?> totalDeath = GeneratedColumn<int?>(
      'total_death', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _newRecoveredMeta =
      const VerificationMeta('newRecovered');
  late final GeneratedColumn<int?> newRecovered = GeneratedColumn<int?>(
      'new_recovered', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _totalRecoveredMeta =
      const VerificationMeta('totalRecovered');
  late final GeneratedColumn<int?> totalRecovered = GeneratedColumn<int?>(
      'total_recovered', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _updateDateMeta = const VerificationMeta('updateDate');
  late final GeneratedColumn<String?> updateDate = GeneratedColumn<String?>(
      'update_date', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _provinceMeta = const VerificationMeta('province');
  late final GeneratedColumn<String?> province = GeneratedColumn<String?>(
      'province', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        txnDate,
        newCase,
        totalCase,
        newCaseExcludeabroad,
        totalCaseExcludeabroad,
        newDeath,
        totalDeath,
        newRecovered,
        totalRecovered,
        updateDate,
        province
      ];
  @override
  String get aliasedName => _alias ?? 'province';
  @override
  String get actualTableName => 'province';
  @override
  VerificationContext validateIntegrity(Insertable<ProvinceEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('txn_date')) {
      context.handle(_txnDateMeta,
          txnDate.isAcceptableOrUnknown(data['txn_date']!, _txnDateMeta));
    } else if (isInserting) {
      context.missing(_txnDateMeta);
    }
    if (data.containsKey('new_case')) {
      context.handle(_newCaseMeta,
          newCase.isAcceptableOrUnknown(data['new_case']!, _newCaseMeta));
    }
    if (data.containsKey('total_case')) {
      context.handle(_totalCaseMeta,
          totalCase.isAcceptableOrUnknown(data['total_case']!, _totalCaseMeta));
    }
    if (data.containsKey('new_case_excludeabroad')) {
      context.handle(
          _newCaseExcludeabroadMeta,
          newCaseExcludeabroad.isAcceptableOrUnknown(
              data['new_case_excludeabroad']!, _newCaseExcludeabroadMeta));
    }
    if (data.containsKey('total_case_excludeabroad')) {
      context.handle(
          _totalCaseExcludeabroadMeta,
          totalCaseExcludeabroad.isAcceptableOrUnknown(
              data['total_case_excludeabroad']!, _totalCaseExcludeabroadMeta));
    }
    if (data.containsKey('new_death')) {
      context.handle(_newDeathMeta,
          newDeath.isAcceptableOrUnknown(data['new_death']!, _newDeathMeta));
    }
    if (data.containsKey('total_death')) {
      context.handle(
          _totalDeathMeta,
          totalDeath.isAcceptableOrUnknown(
              data['total_death']!, _totalDeathMeta));
    }
    if (data.containsKey('new_recovered')) {
      context.handle(
          _newRecoveredMeta,
          newRecovered.isAcceptableOrUnknown(
              data['new_recovered']!, _newRecoveredMeta));
    }
    if (data.containsKey('total_recovered')) {
      context.handle(
          _totalRecoveredMeta,
          totalRecovered.isAcceptableOrUnknown(
              data['total_recovered']!, _totalRecoveredMeta));
    }
    if (data.containsKey('update_date')) {
      context.handle(
          _updateDateMeta,
          updateDate.isAcceptableOrUnknown(
              data['update_date']!, _updateDateMeta));
    }
    if (data.containsKey('province')) {
      context.handle(_provinceMeta,
          province.isAcceptableOrUnknown(data['province']!, _provinceMeta));
    } else if (isInserting) {
      context.missing(_provinceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {txnDate, province};
  @override
  ProvinceEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ProvinceEntry.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ProvinceTable createAlias(String alias) {
    return $ProvinceTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $TodayTable today = $TodayTable(this);
  late final $TimelineTable timeline = $TimelineTable(this);
  late final $ProvinceTable province = $ProvinceTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [today, timeline, province];
}
