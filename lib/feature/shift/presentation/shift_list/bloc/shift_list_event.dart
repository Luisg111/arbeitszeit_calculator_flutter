import "package:arbeitszeit_calculator_flutter/feature/shift/domain/model/shift.dart";

sealed class ShiftListEvent {}

class ShiftListInitialized extends ShiftListEvent {}

class ShiftListRefresh extends ShiftListEvent {}

class ShiftListSelectedMonthChanged extends ShiftListEvent {
  ShiftListSelectedMonthChanged(this.newMonthInput);

  final String newMonthInput;
}

class ShiftListSelectedYearChanged extends ShiftListEvent {
  ShiftListSelectedYearChanged(this.newYearInput);

  final String newYearInput;
}

class ShiftListItemDeleted extends ShiftListEvent {
  ShiftListItemDeleted(this.shift);

  final Shift shift;
}
