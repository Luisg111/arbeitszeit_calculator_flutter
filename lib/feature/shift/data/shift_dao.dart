import 'package:arbeitszeit_calculator_flutter/feature/shift/data/database.dart';
import 'package:arbeitszeit_calculator_flutter/feature/shift/data/shift_table.dart';
import 'package:drift/drift.dart';

part "shift_dao.g.dart";

@DriftAccessor(tables: [ShiftTable])
class ShiftDao extends DatabaseAccessor<Database> with _$ShiftDaoMixin {
  ShiftDao(super.attachedDatabase);

  /// Returns a list of shifts for a given year and/or month.
  ///
  /// If `year` or `month` is `null`, that part of the condition is ignored,
  /// and all years/months are included in the result.
  ///
  /// [year] – The target year.
  /// [month] – The target month.
  ///
  /// Returns a list of [ShiftTableData] that match the filter criteria.
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

  /// Returns a single shift by its ID.
  ///
  /// [id] – The ID of the shift to retrieve.
  ///
  /// Returns a [ShiftTableData] object representing the shift.
  Future<ShiftTableData> getShift(int id) async {
    return (select(shiftTable)
      ..where((row) => row.id.equals(id))).getSingle();
  }

  /// Creates a new shift or updates an existing one if a conflict occurs (e.g., same ID).
  ///
  /// [shift] – The shift data to insert or update as a [ShiftTableCompanion].
  ///
  /// Returns the ID of the inserted or updated row.
  Future<int> createOrUpdateShift(ShiftTableCompanion shift) async {
    return into(shiftTable).insertOnConflictUpdate(shift);
  }

  /// Deletes a shift by its ID.
  ///
  /// [id] – The ID of the shift to delete.
  ///
  /// Returns the number of affected rows (should be 1 or 0).
  Future<int> deleteShift(int id) async {
    return (delete(shiftTable)
      ..where((row) => row.id.equals(id))).go();
  }

  /// Calculates the total work time in seconds for a specific month.
  ///
  /// Work time is computed as the difference between `end` and `start`
  /// timestamps minus the break time.
  ///
  /// [year] – The year to filter by.
  /// [month] – The month to filter by.
  ///
  /// Returns the total work time in seconds.
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
