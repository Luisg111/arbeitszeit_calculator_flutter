import 'package:bloc/bloc.dart';

import 'shift_list_event.dart';
import 'shift_list_state.dart';

class ShiftListBloc extends Bloc<ShiftListEvent, ShiftListState> {
  ShiftListBloc() : super(ShiftListState.empty()) {
    on<ShiftListEvent>((event, emit) {
      switch (event) {
        case ShiftListInitialized _:
          _initialize(emit);
        case ShiftListSelectedYearChanged _:
          _selectedYearChanged(event, emit);
        case ShiftListSelectedMonthChanged _:
          _selectedMonthChanged(event, emit);
      }
    });
  }

  Future<void> _initialize(Emitter<ShiftListState> emit) async {}

  void _selectedYearChanged(
    ShiftListSelectedYearChanged event,
    Emitter<ShiftListState> emit,
  ) {
    var year = int.tryParse(event.newYearInput);
    if (year != null && year > 0) {
      emit(state.copyWith(selectedYear: year, selectedYearValid: true));
    } else {
      emit(state.copyWith(selectedYearValid: false));
    }
  }

  void _selectedMonthChanged(
    ShiftListSelectedMonthChanged event,
    Emitter<ShiftListState> emit,
  ) {
    //print("month changed!");
    var month = int.tryParse(event.newMonthInput);
    if (month != null && month >= 1 && month <= 12) {
      emit(state.copyWith(selectedYear: month, selectedMonthValid: true));
    } else {
      emit(state.copyWith(selectedMonthValid: false));
      print("month changed! invalid");

    }
  }
}
