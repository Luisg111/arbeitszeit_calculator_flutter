import 'package:arbeitszeit_calculator_flutter/feature/shift/data/shift_extensions.dart';

import '../../data/database.dart';
import '../model/shift.dart';

class ShiftRepository {
  final Database _db;

  ShiftRepository({required Database db}) : _db = db;

  Future<List<Shift>> getShifts({int? year, int? month}) async {
    var databaseResult = await _db.shiftDao.getShifts(year, month);
    return databaseResult.map((element) => element.toDto()).toList();
  }

  Future<Shift> getShift(int id) async {
    var databaseResult = await _db.shiftDao.getShift(id);
    return databaseResult.toDto();
  }

  Future<int> storeShift(Shift shift) async {
    return _db.shiftDao.createOrUpdateShift(shift.toTableData());
  }

  Future<int> deleteShift(int shiftId) async {
    return _db.shiftDao.deleteShift(shiftId);
  }
}
