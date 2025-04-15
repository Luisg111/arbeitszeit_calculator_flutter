import 'package:arbeitszeit_calculator_flutter/feature/shift/data/shift_dao.dart';
import 'package:arbeitszeit_calculator_flutter/feature/shift/data/shift_table.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part "database.g.dart";

@DriftDatabase(tables: [ShiftTable],daos: [ShiftDao])
class Database extends _$Database {
  Database([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'shift_database',
      // If you need web support, see https://drift.simonbinder.eu/platforms/web/
    );
  }
}
