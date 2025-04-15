// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ShiftTableTable extends ShiftTable
    with TableInfo<$ShiftTableTable, ShiftTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShiftTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _startMeta = const VerificationMeta('start');
  @override
  late final GeneratedColumn<DateTime> start = GeneratedColumn<DateTime>(
    'start',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endMeta = const VerificationMeta('end');
  @override
  late final GeneratedColumn<DateTime> end = GeneratedColumn<DateTime>(
    'end',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _breakTimeMeta = const VerificationMeta(
    'breakTime',
  );
  @override
  late final GeneratedColumn<int> breakTime = GeneratedColumn<int>(
    'break_time',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, start, end, breakTime];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'shift';
  @override
  VerificationContext validateIntegrity(
    Insertable<ShiftTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('start')) {
      context.handle(
        _startMeta,
        start.isAcceptableOrUnknown(data['start']!, _startMeta),
      );
    } else if (isInserting) {
      context.missing(_startMeta);
    }
    if (data.containsKey('end')) {
      context.handle(
        _endMeta,
        end.isAcceptableOrUnknown(data['end']!, _endMeta),
      );
    } else if (isInserting) {
      context.missing(_endMeta);
    }
    if (data.containsKey('break_time')) {
      context.handle(
        _breakTimeMeta,
        breakTime.isAcceptableOrUnknown(data['break_time']!, _breakTimeMeta),
      );
    } else if (isInserting) {
      context.missing(_breakTimeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ShiftTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ShiftTableData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      start:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}start'],
          )!,
      end:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}end'],
          )!,
      breakTime:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}break_time'],
          )!,
    );
  }

  @override
  $ShiftTableTable createAlias(String alias) {
    return $ShiftTableTable(attachedDatabase, alias);
  }
}

class ShiftTableData extends DataClass implements Insertable<ShiftTableData> {
  final int id;
  final DateTime start;
  final DateTime end;
  final int breakTime;
  const ShiftTableData({
    required this.id,
    required this.start,
    required this.end,
    required this.breakTime,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['start'] = Variable<DateTime>(start);
    map['end'] = Variable<DateTime>(end);
    map['break_time'] = Variable<int>(breakTime);
    return map;
  }

  ShiftTableCompanion toCompanion(bool nullToAbsent) {
    return ShiftTableCompanion(
      id: Value(id),
      start: Value(start),
      end: Value(end),
      breakTime: Value(breakTime),
    );
  }

  factory ShiftTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ShiftTableData(
      id: serializer.fromJson<int>(json['id']),
      start: serializer.fromJson<DateTime>(json['start']),
      end: serializer.fromJson<DateTime>(json['end']),
      breakTime: serializer.fromJson<int>(json['breakTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'start': serializer.toJson<DateTime>(start),
      'end': serializer.toJson<DateTime>(end),
      'breakTime': serializer.toJson<int>(breakTime),
    };
  }

  ShiftTableData copyWith({
    int? id,
    DateTime? start,
    DateTime? end,
    int? breakTime,
  }) => ShiftTableData(
    id: id ?? this.id,
    start: start ?? this.start,
    end: end ?? this.end,
    breakTime: breakTime ?? this.breakTime,
  );
  ShiftTableData copyWithCompanion(ShiftTableCompanion data) {
    return ShiftTableData(
      id: data.id.present ? data.id.value : this.id,
      start: data.start.present ? data.start.value : this.start,
      end: data.end.present ? data.end.value : this.end,
      breakTime: data.breakTime.present ? data.breakTime.value : this.breakTime,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ShiftTableData(')
          ..write('id: $id, ')
          ..write('start: $start, ')
          ..write('end: $end, ')
          ..write('breakTime: $breakTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, start, end, breakTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ShiftTableData &&
          other.id == this.id &&
          other.start == this.start &&
          other.end == this.end &&
          other.breakTime == this.breakTime);
}

class ShiftTableCompanion extends UpdateCompanion<ShiftTableData> {
  final Value<int> id;
  final Value<DateTime> start;
  final Value<DateTime> end;
  final Value<int> breakTime;
  const ShiftTableCompanion({
    this.id = const Value.absent(),
    this.start = const Value.absent(),
    this.end = const Value.absent(),
    this.breakTime = const Value.absent(),
  });
  ShiftTableCompanion.insert({
    this.id = const Value.absent(),
    required DateTime start,
    required DateTime end,
    required int breakTime,
  }) : start = Value(start),
       end = Value(end),
       breakTime = Value(breakTime);
  static Insertable<ShiftTableData> custom({
    Expression<int>? id,
    Expression<DateTime>? start,
    Expression<DateTime>? end,
    Expression<int>? breakTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (start != null) 'start': start,
      if (end != null) 'end': end,
      if (breakTime != null) 'break_time': breakTime,
    });
  }

  ShiftTableCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? start,
    Value<DateTime>? end,
    Value<int>? breakTime,
  }) {
    return ShiftTableCompanion(
      id: id ?? this.id,
      start: start ?? this.start,
      end: end ?? this.end,
      breakTime: breakTime ?? this.breakTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (start.present) {
      map['start'] = Variable<DateTime>(start.value);
    }
    if (end.present) {
      map['end'] = Variable<DateTime>(end.value);
    }
    if (breakTime.present) {
      map['break_time'] = Variable<int>(breakTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShiftTableCompanion(')
          ..write('id: $id, ')
          ..write('start: $start, ')
          ..write('end: $end, ')
          ..write('breakTime: $breakTime')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  $DatabaseManager get managers => $DatabaseManager(this);
  late final $ShiftTableTable shiftTable = $ShiftTableTable(this);
  late final ShiftDao shiftDao = ShiftDao(this as Database);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [shiftTable];
}

typedef $$ShiftTableTableCreateCompanionBuilder =
    ShiftTableCompanion Function({
      Value<int> id,
      required DateTime start,
      required DateTime end,
      required int breakTime,
    });
typedef $$ShiftTableTableUpdateCompanionBuilder =
    ShiftTableCompanion Function({
      Value<int> id,
      Value<DateTime> start,
      Value<DateTime> end,
      Value<int> breakTime,
    });

class $$ShiftTableTableFilterComposer
    extends Composer<_$Database, $ShiftTableTable> {
  $$ShiftTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get start => $composableBuilder(
    column: $table.start,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get end => $composableBuilder(
    column: $table.end,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get breakTime => $composableBuilder(
    column: $table.breakTime,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ShiftTableTableOrderingComposer
    extends Composer<_$Database, $ShiftTableTable> {
  $$ShiftTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get start => $composableBuilder(
    column: $table.start,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get end => $composableBuilder(
    column: $table.end,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get breakTime => $composableBuilder(
    column: $table.breakTime,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ShiftTableTableAnnotationComposer
    extends Composer<_$Database, $ShiftTableTable> {
  $$ShiftTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get start =>
      $composableBuilder(column: $table.start, builder: (column) => column);

  GeneratedColumn<DateTime> get end =>
      $composableBuilder(column: $table.end, builder: (column) => column);

  GeneratedColumn<int> get breakTime =>
      $composableBuilder(column: $table.breakTime, builder: (column) => column);
}

class $$ShiftTableTableTableManager
    extends
        RootTableManager<
          _$Database,
          $ShiftTableTable,
          ShiftTableData,
          $$ShiftTableTableFilterComposer,
          $$ShiftTableTableOrderingComposer,
          $$ShiftTableTableAnnotationComposer,
          $$ShiftTableTableCreateCompanionBuilder,
          $$ShiftTableTableUpdateCompanionBuilder,
          (
            ShiftTableData,
            BaseReferences<_$Database, $ShiftTableTable, ShiftTableData>,
          ),
          ShiftTableData,
          PrefetchHooks Function()
        > {
  $$ShiftTableTableTableManager(_$Database db, $ShiftTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$ShiftTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$ShiftTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$ShiftTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> start = const Value.absent(),
                Value<DateTime> end = const Value.absent(),
                Value<int> breakTime = const Value.absent(),
              }) => ShiftTableCompanion(
                id: id,
                start: start,
                end: end,
                breakTime: breakTime,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required DateTime start,
                required DateTime end,
                required int breakTime,
              }) => ShiftTableCompanion.insert(
                id: id,
                start: start,
                end: end,
                breakTime: breakTime,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ShiftTableTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $ShiftTableTable,
      ShiftTableData,
      $$ShiftTableTableFilterComposer,
      $$ShiftTableTableOrderingComposer,
      $$ShiftTableTableAnnotationComposer,
      $$ShiftTableTableCreateCompanionBuilder,
      $$ShiftTableTableUpdateCompanionBuilder,
      (
        ShiftTableData,
        BaseReferences<_$Database, $ShiftTableTable, ShiftTableData>,
      ),
      ShiftTableData,
      PrefetchHooks Function()
    >;

class $DatabaseManager {
  final _$Database _db;
  $DatabaseManager(this._db);
  $$ShiftTableTableTableManager get shiftTable =>
      $$ShiftTableTableTableManager(_db, _db.shiftTable);
}
