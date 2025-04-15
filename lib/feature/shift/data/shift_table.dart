import 'package:drift/drift.dart';

class ShiftTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  DateTimeColumn get start => dateTime()();

  DateTimeColumn get end => dateTime()();

  IntColumn get breakTime => integer()();

  @override
  String get tableName => 'shift';
}
