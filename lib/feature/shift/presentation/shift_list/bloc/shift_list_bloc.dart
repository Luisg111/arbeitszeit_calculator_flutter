import 'package:arbeitszeit_calculator_flutter/feature/shift/presentation/error_handler.dart';
import 'package:arbeitszeit_calculator_flutter/feature/shift/domain/model/result.dart';
import 'package:arbeitszeit_calculator_flutter/feature/shift/domain/repository/shift_repository.dart';
import 'package:bloc/bloc.dart';

import '../../../domain/model/shift.dart';
import 'shift_list_event.dart';
import 'shift_list_state.dart';

class ShiftListBloc extends Bloc<ShiftListEvent, ShiftListState> {
  final ShiftRepository _repository;
  final ErrorHandler _handler;

  ShiftListBloc(this._repository, this._handler)
    : super(ShiftListState.empty()) {
    on<ShiftListEvent>((event, emit) async {
      switch (event) {
        case ShiftListInitialized _:
          await _initialize(emit);
        case ShiftListRefresh _:
          await _loadData(emit);
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

    List<Shift> newShifts = List.empty();
    Duration newWorkTime = Duration.zero;

    //get shifts
    switch (await _repository.getShifts(
      year: state.selectedYear,
      month: state.selectedMonth,
    )) {
      case Ok<List<Shift>> shiftResponse:
        newShifts = shiftResponse.value;
      case Failure<List<Shift>> shiftResponse:
        _handler.handle(shiftResponse.error);
        emit(state.copyWith(isLoading: false));
        return;
    }

    //get total worktime for month
    switch (await _repository.getTotalWorktime(
      state.selectedYear,
      state.selectedMonth,
    )) {
      case Ok<Duration> response:
        newWorkTime = response.value;
      case Failure<Duration> response:
        _handler.handle(response.error);
        emit(state.copyWith(isLoading: false));
        return;
    }

    emit(
      state.copyWith(
        shifts: newShifts,
        totalWorkTime: newWorkTime,
        isLoading: false,
      ),
    );
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
