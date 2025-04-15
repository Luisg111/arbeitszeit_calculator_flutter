import 'package:arbeitszeit_calculator_flutter/feature/shift/domain/repository/shift_repository.dart';
import 'package:bloc/bloc.dart';

import '../../../domain/model/shift.dart';
import 'shift_list_event.dart';
import 'shift_list_state.dart';

class ShiftListBloc extends Bloc<ShiftListEvent, ShiftListState> {
  final ShiftRepository _repository;

  ShiftListBloc(this._repository) : super(ShiftListState.empty()) {
    on<ShiftListEvent>((event, emit) async {
      switch (event) {
        case ShiftListInitialized _:
          await _initialize(emit);
        case ShiftListSelectedYearChanged _:
          await _selectedYearChanged(event, emit);
        case ShiftListSelectedMonthChanged _:
          await _selectedMonthChanged(event, emit);
      }
    });
  }

  Future<void> _initialize(Emitter<ShiftListState> emit) async {
    await _loadData(emit);
  }

  Future<void> _loadData(Emitter<ShiftListState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      var shifts = await _repository.getShifts(
        year: state.selectedYear,
        month: state.selectedMonth,
      );
      emit(state.copyWith(shifts: shifts));
    } catch (e) {}
    emit(state.copyWith(isLoading: false));
  }

  Future<void> _selectedYearChanged(
    ShiftListSelectedYearChanged event,
    Emitter<ShiftListState> emit,
  ) async {
    var year = int.tryParse(event.newYearInput);
    if (year != null && year > 0) {
      emit(state.copyWith(selectedYear: year, selectedYearValid: true));
      await _loadData(emit);
    } else {
      emit(state.copyWith(selectedYearValid: false));
    }
  }

  Future<void> _selectedMonthChanged(
    ShiftListSelectedMonthChanged event,
    Emitter<ShiftListState> emit,
  ) async {
    //print("month changed!");
    var month = int.tryParse(event.newMonthInput);
    if (month != null && month >= 1 && month <= 12) {
      emit(state.copyWith(selectedMonth: month, selectedMonthValid: true));
      await _loadData(emit);
    } else {
      emit(state.copyWith(selectedMonthValid: false));
    }
  }
}
