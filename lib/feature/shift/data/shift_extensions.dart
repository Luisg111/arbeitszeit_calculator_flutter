import 'package:arbeitszeit_calculator_flutter/feature/shift/data/database.dart';
import 'package:arbeitszeit_calculator_flutter/feature/shift/domain/model/shift.dart';

extension ShiftToDatabase on Shift {
  ShiftTableCompanion toTableData() {
    return ShiftTableCompanion.insert(
      start: startDate,
      end: endDate,
      breakTime: breakTime.inSeconds,
    );
  }
}

extension ShiftFromDatabase on ShiftTableData {
  Shift toDto() {
    return Shift(
      id: id,
      startDate: start,
      endDate: end,
      breakTime: Duration(seconds: breakTime),
    );
  }
}
