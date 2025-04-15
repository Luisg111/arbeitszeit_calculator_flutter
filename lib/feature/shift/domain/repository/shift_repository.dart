import '../../data/database.dart';
import '../model/shift.dart';

class ShiftRepository {
  final Database _db;

  ShiftRepository({required Database db}) : _db = db;

  Future<List<Shift>> getShifts({int? year, int? month}) async {
    return [
      Shift(
        id: 1,
        startDate: DateTime.now(),
        endDate: DateTime.now().add(Duration(hours: 4)),
        breakTime: Duration(hours: 1),
      ),
    ];
  }

  Future<Shift> getShift(int id) async {
    return Shift(
      id: 1,
      startDate: DateTime.now(),
      endDate: DateTime.now().add(Duration(hours: 4)),
      breakTime: Duration(hours: 1),
    );
  }

  Future<int> storeShift(Shift shift) async {
    return 1;
  }

  Future<void> deleteShift(int shiftId) async {}
}
