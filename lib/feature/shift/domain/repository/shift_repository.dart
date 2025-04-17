import 'package:arbeitszeit_calculator_flutter/feature/shift/data/shift_extensions.dart';
import 'package:arbeitszeit_calculator_flutter/feature/shift/domain/exception/database_exception.dart';

import '../../data/database.dart';
import '../model/shift.dart';
import '../model/result.dart';

class ShiftRepository {
  final Database _db;

  ShiftRepository({required Database db}) : _db = db;

  /// Retrieves a list of shifts, optionally filtered by [year] and/or [month].
  ///
  /// If [year] or [month] is null, it will not be used as a filter.
  ///
  /// Returns a [Result] containing a list of [Shift]s on success,
  /// or a failure result if an exception occurs.
  Future<Result<List<Shift>>> getShifts({int? year, int? month}) async {
    try {
      assert(year == null || year > 0);
      assert(month == null || (month >= 1 && month <= 12));

      var databaseResult = await _db.shiftDao.getShifts(year, month);
      return Result.ok(
        databaseResult.map((element) => element.toDto()).toList(),
      );
    } catch (e) {
      return Result.failure(DatabaseUnknownException());
    }
  }

  /// Retrieves a single shift by its [id].
  ///
  /// Returns a [Result] containing the [Shift] on success.
  /// If the shift is not found, returns a [DatabaseEntryNotFound] failure.
  Future<Result<Shift>> getShift(int id) async {
    try {
      var databaseResult = await _db.shiftDao.getShift(id);
      return Result.ok(databaseResult.toDto());
    } on StateError {
      return Result.failure(DatabaseEntryNotFound());
    } catch (e) {
      return Result.failure(DatabaseUnknownException());
    }
  }

  /// Stores a shift in the database. If a shift with the same ID exists, it is updated.
  ///
  /// [shift] – The [Shift] object to store.
  ///
  /// Returns a [Result] containing the ID of the stored shift on success
  /// or a failure result if an exception occurs.
  Future<Result<int>> storeShift(Shift shift) async {
    assert(shift.id != null);
    assert(shift.endDate.isAfter(shift.startDate));
    assert(!shift.workTime.isNegative);

    try {
      return Result.ok(
        await _db.shiftDao.createOrUpdateShift(shift.toCompanion()),
      );
    } catch (e) {
      return Result.failure(DatabaseUnknownException());
    }
  }

  /// Deletes a shift from the database using its [shiftId].
  ///
  /// Returns a [Result] containing the number of affected rows on success
  /// or a failure result if an exception occurs.
  Future<Result<int>> deleteShift(int shiftId) async {
    try {
      return Result.ok(await _db.shiftDao.deleteShift(shiftId));
    } catch (e) {
      return Result.failure(DatabaseUnknownException());
    }
  }

  /// Calculates the total worktime for a given [year] and [month].
  ///
  /// Returns a [Result] containing the total [Duration] of worktime on success
  /// or a failure result if an exception occurs.
  Future<Result<Duration>> getTotalWorktime(int year, int month) async {
    assert( year > 0);
    assert(month >= 1 && month <= 12);

    try {
      return Result.ok(
        Duration(seconds: await _db.shiftDao.getWorktimeSeconds(year, month)),
      );
    } catch (e) {
      return Result.failure(DatabaseUnknownException());
    }
  }
}
