import 'package:arbeitszeit_calculator_flutter/feature/shift/data/shift_extensions.dart';
import 'package:arbeitszeit_calculator_flutter/feature/shift/domain/exception/database_exception.dart';

import '../../data/database.dart';
import '../model/shift.dart';
import '../model/result.dart';

class ShiftRepository {
  final Database _db;

  ShiftRepository({required Database db}) : _db = db;

  Future<Result<List<Shift>>> getShifts({int? year, int? month}) async {
    try {
      var databaseResult = await _db.shiftDao.getShifts(year, month);
      return Result.ok(
        databaseResult.map((element) => element.toDto()).toList(),
      );
    } catch (e) {
      return Result.failure(DatabaseUnknownException());
    }
  }

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

  Future<Result<int>> storeShift(Shift shift) async {
    try {
      return Result.ok(
        await _db.shiftDao.createOrUpdateShift(shift.toCompanion()),
      );
    } catch (e) {
      return Result.failure(DatabaseUnknownException());
    }
  }

  Future<Result<int>> deleteShift(int shiftId) async {
    try {
      return Result.ok(await _db.shiftDao.deleteShift(shiftId));
    } catch (e) {
      return Result.failure(DatabaseUnknownException());
    }
  }
}
