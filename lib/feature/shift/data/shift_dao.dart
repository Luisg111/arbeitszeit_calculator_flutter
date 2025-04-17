import 'package:arbeitszeit_calculator_flutter/feature/shift/data/database.dart';
import 'package:arbeitszeit_calculator_flutter/feature/shift/data/shift_table.dart';
import 'package:drift/drift.dart';

part "shift_dao.g.dart";

@DriftAccessor(tables: [ShiftTable])
class ShiftDao extends DatabaseAccessor<Database> with _$ShiftDaoMixin {
  ShiftDao(super.attachedDatabase);

  Future<List<ShiftTableData>> getShifts(int? year, int? month) async {
    return (select(shiftTable)
      ..where(
            (row) =>
        row.start.year.equalsExp(coalesce([Variable(year), row.start.year])) &
        row.start.month.equalsExp(
          coalesce([Variable(month), row.start.month]),
        ),
      )).get();
  }

  Future<ShiftTableData> getShift(int id) async {
    return (select(shiftTable)
      ..where((row) => row.id.equals(id))).getSingle();
  }

  Future<int> createOrUpdateShift(ShiftTableCompanion shift) async {
    return into(shiftTable).insertOnConflictUpdate(shift);
  }

  Future<int> deleteShift(int id) async {
    return (delete(shiftTable)
      ..where((row) => row.id.equals(id))).go();
  }

  Future<int> getWorktimeSeconds(int year, int month) async {
    final sumColumn =
    ((shiftTable.end.unixepoch - shiftTable.start.unixepoch) -
            shiftTable.breakTime)
        .sum();

    final monthYearColumn = (shiftTable.start.strftime("%m-%Y"));

    var result =
    await (selectOnly(shiftTable)
      ..addColumns([sumColumn, monthYearColumn])
      ..groupBy([monthYearColumn]))
        .getSingle();

    return result.read(sumColumn)!;
  }
}
