import "package:arbeitszeit_calculator_flutter/feature/shift/domain/model/result.dart";
import "package:arbeitszeit_calculator_flutter/feature/shift/domain/model/shift.dart";
import "package:arbeitszeit_calculator_flutter/feature/shift/domain/repository/shift_repository.dart";
import "package:arbeitszeit_calculator_flutter/feature/shift/presentation/error_handler.dart";
import "package:arbeitszeit_calculator_flutter/feature/shift/presentation/shift_list/bloc/shift_list_event.dart";
import "package:arbeitszeit_calculator_flutter/feature/shift/presentation/shift_list/bloc/shift_list_state.dart";
import "package:bloc/bloc.dart";

class ShiftListBloc extends Bloc<ShiftListEvent, ShiftListState> {
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
        case ShiftListItemDeleted _:
          await _shiftDeleted(event, emit);
      }
    });
  }

  final ShiftRepository _repository;
  final ErrorHandler _handler;

  Future<void> _initialize(Emitter<ShiftListState> emit) async {
    await _loadData(emit);
  }

  Future<void> _loadData(
    Emitter<ShiftListState> emit, {
    bool loadInBackground = false,
  }) async {
    if (!loadInBackground) {
      emit(state.copyWith(isLoading: true));
    }

    var newShifts = List<Shift>.empty();
    var newWorkTime = Duration.zero;

    //get shifts
    switch (await _repository.getShifts(
      year: state.selectedYear,
      month: state.selectedMonth,
    )) {
      case final Ok<List<Shift>> shiftResponse:
        newShifts = shiftResponse.value;
      case final Failure<List<Shift>> shiftResponse:
        _handler.handle(shiftResponse.error);
        emit(state.copyWith(isLoading: false));
        return;
    }

    //get total worktime for month
    switch (await _repository.getTotalWorktime(
      state.selectedYear,
      state.selectedMonth,
    )) {
      case final Ok<Duration> response:
        newWorkTime = response.value;
      case final Failure<Duration> response:
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
    final year = int.tryParse(event.newYearInput);
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
    final month = int.tryParse(event.newMonthInput);
    if (month != null && month >= 1 && month <= 12) {
      emit(state.copyWith(selectedMonth: month, selectedMonthValid: true));
      await _loadData(emit);
    } else {
      emit(state.copyWith(selectedMonthValid: false));
    }
  }

  Future<void> _shiftDeleted(
    ShiftListItemDeleted event,
    Emitter<ShiftListState> emit,
  ) async {
    assert(
      event.shift.id != null,
      "Shift must have an id in order to be deleted!",
    );

    final oldItems = List.of(state.shifts);
    emit(state.copyWith(shifts: state.shifts..remove(event.shift)));

    final databaseResponse = await _repository.deleteShift(event.shift.id!);
    switch (databaseResponse) {
      case Ok<int> _:
        break;
      case Failure<int> _:
        _handler.handle(databaseResponse.error);
        emit(state.copyWith(shifts: oldItems));
    }

    await _loadData(emit, loadInBackground: true);
  }
}
