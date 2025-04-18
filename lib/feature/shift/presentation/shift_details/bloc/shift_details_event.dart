sealed class ShiftDetailsEvent {}

class ShiftDetailsInitialized extends ShiftDetailsEvent {}

class ShiftDetailsStoreShift extends ShiftDetailsEvent {}

class ShiftDetailsDeleteShift extends ShiftDetailsEvent {}

sealed class ShiftDetailsDateChanged extends ShiftDetailsEvent {

  ShiftDetailsDateChanged(this.selectedDateTime);
  final DateTime selectedDateTime;
}

class ShiftDetailsStartDateChanged extends ShiftDetailsDateChanged {
  ShiftDetailsStartDateChanged(super.selectedDateTime);
}

class ShiftDetailsEndDateChanged extends ShiftDetailsDateChanged {
  ShiftDetailsEndDateChanged(super.selectedDateTime);
}

class ShiftDetailsDurationChanged extends ShiftDetailsEvent {

  ShiftDetailsDurationChanged(this.selectedDuration);
  final Duration selectedDuration;
}