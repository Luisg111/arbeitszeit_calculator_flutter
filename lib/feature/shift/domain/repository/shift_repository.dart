import '../../data/database.dart';
import '../model/shift.dart';

class ShiftRepository {
  final Database _db;

  ShiftRepository({required Database db}) : _db = db;

  Future<List<Shift>> getShifts() async {
    return [
      Shift(
        id: 1,
        startDate: DateTime.now(),
        endDate: DateTime.now().add(Duration(hours: 4)),
        breakTime: Duration(hours: 1),
      ),
    ];
  }
}
