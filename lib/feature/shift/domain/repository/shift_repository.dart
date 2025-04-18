import "package:arbeitszeit_calculator_flutter/feature/shift/data/database.dart";
import "package:arbeitszeit_calculator_flutter/feature/shift/data/shift_extensions.dart";
import "package:arbeitszeit_calculator_flutter/feature/shift/domain/exception/database_exception.dart";
import "package:arbeitszeit_calculator_flutter/feature/shift/domain/model/result.dart";
import "package:arbeitszeit_calculator_flutter/feature/shift/domain/model/shift.dart";

class ShiftRepository {
  ShiftRepository({required Database db}) : _db = db;

  final Database _db;

  /// Retrieves a list of shifts, optionally filtered by [year] and/or [month].
  ///
  /// If [year] or [month] is null, it will not be used as a filter.
  ///
  /// Returns a [Result] containing a list of [Shift]s on success,
  /// or a failure result if an exception occurs.
  Future<Result<List<Shift>>> getShifts({int? year, int? month}) async {
    try {
      assert(
        year == null || year > 0,
        "year filter must be a valid year if present",
      );
      assert(
        month == null || (month >= 1 && month <= 12),
        "month filter must be a valid month (1 <= month <= 12) if present",
      );

      final databaseResult = await _db.shiftDao.getShifts(year, month);
      return Result.ok(
        databaseResult.map((element) => element.toDto()).toList(),
      );
    } on Exception {
      return Result.failure(DatabaseUnknownException());
    }
  }

  /// Retrieves a single shift by its [id].
  ///
  /// Returns a [Result] containing the [Shift] on success.
  /// If the shift is not found, returns a [DatabaseEntryNotFound] failure.
  Future<Result<Shift>> getShift(int id) async {
    try {
      final databaseResult = await _db.shiftDao.getShift(id);
      if (databaseResult != null) {
        return Result.ok(databaseResult.toDto());
      } else {
        return Result.failure(DatabaseEntryNotFound());
      }
    } on Exception {
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
    assert(
      shift.endDate.isAfter(shift.startDate),
      "shift end must be after shift start",
    );
    assert(!shift.workTime.isNegative, "shift work time must not be negative");

    try {
      return Result.ok(
        await _db.shiftDao.createOrUpdateShift(shift.toCompanion()),
      );
    } on Exception {
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
    } on Exception {
      return Result.failure(DatabaseUnknownException());
    }
  }

  /// Calculates the total worktime for a given [year] and [month].
  ///
  /// Returns a [Result] containing the total [Duration] of worktime on success
  /// or a failure result if an exception occurs.
  Future<Result<Duration>> getTotalWorktime(int year, int month) async {
    assert(year > 0, "year filter must be a valid year");
    assert(
      month >= 1 && month <= 12,
      "month filter must be a valid month (1 <= month <= 12)",
    );

    try {
      return Result.ok(
        Duration(seconds: await _db.shiftDao.getWorktimeSeconds(year, month)),
      );
    } on Exception {
      return Result.failure(DatabaseUnknownException());
    }
  }
}
