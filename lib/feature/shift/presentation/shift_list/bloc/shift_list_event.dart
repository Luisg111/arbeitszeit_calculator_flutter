sealed class ShiftListEvent {}

class ShiftListInitialized extends ShiftListEvent {}

class ShiftListSelectedMonthChanged extends ShiftListEvent {
  final String newMonthInput;

  ShiftListSelectedMonthChanged(this.newMonthInput);
}

class ShiftListSelectedYearChanged extends ShiftListEvent {
  final String newYearInput;

  ShiftListSelectedYearChanged(this.newYearInput);
}
