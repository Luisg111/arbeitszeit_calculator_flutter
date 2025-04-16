import 'package:arbeitszeit_calculator_flutter/feature/shift/domain/repository/shift_repository.dart';
import 'package:bloc/bloc.dart';

import '../../../domain/model/shift.dart';
import 'shift_details_event.dart';
import 'shift_details_state.dart';

class ShiftDetailsBloc extends Bloc<ShiftDetailsEvent, ShiftDetailsState> {
  final int? _initialId;
  final ShiftRepository _repository;

  ShiftDetailsBloc(this._initialId, this._repository)
    : super(ShiftDetailsState.empty()) {
    on<ShiftDetailsEvent>((event, emit) async {
      switch (event) {
        case ShiftDetailsInitialized _:
          await _initialize(emit);
        case ShiftDetailsStoreShift _:
          await _storeShiftData(emit);
        case ShiftDetailsDeleteShift _:
          await _deleteShift(emit);
        case ShiftDetailsDateChanged _:
          _selectedDateChanged(event, emit);
        case ShiftDetailsDurationChanged _:
          _selectedDurationChanged(event, emit);
      }
    });
  }

  Future<void> _initialize(Emitter<ShiftDetailsState> emit) async {
    if (_initialId != null) {
      emit(state.copyWith(shiftId: _initialId));
      await _loadShiftData(emit);
    }
  }

  Future<void> _loadShiftData(Emitter<ShiftDetailsState> emit) async {
    if (state.shiftId == null) {
      return;
    }

    emit(state.copyWith(isLoading: true));

    try {
      var shift = await _repository.getShift(state.shiftId!);
      emit(
        state.copyWith(
          shiftId: shift.id,
          breakDuration: shift.breakTime,
          startDateTime: shift.startDate,
          endDateTime: shift.endDate,
        ),
      );
    } catch (e) {
      //TODO: add error handling
    }
    emit(state.copyWith(isLoading: false));
  }

  Future<void> _storeShiftData(Emitter<ShiftDetailsState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      var shift = Shift(
        id: state.shiftId,
        breakTime: state.breakDuration,
        startDate: state.startDateTime,
        endDate: state.endDateTime,
      );
      var shiftId = await _repository.storeShift(shift);
      emit(state.copyWith(shiftId: shiftId));
    } catch (e) {
      //TODO: add error handling
    }
    emit(state.copyWith(isLoading: false, closeScreen: true));
  }

  Future<void> _deleteShift(Emitter<ShiftDetailsState> emit) async {
    if (state.shiftId == null) {
      return;
    }

    emit(state.copyWith(isLoading: true));
    try {
      await _repository.deleteShift(state.shiftId!);
      emit(state.copyWith(closeScreen: true));
    } catch (e) {
      //TODO: add error handling
    }
    emit(state.copyWith(isLoading: false));
  }

  void _selectedDateChanged(
    ShiftDetailsDateChanged event,
    Emitter<ShiftDetailsState> emit,
  ) {
    switch (event) {
      case ShiftDetailsStartDateChanged _:
        emit(state.copyWith(startDateTime: event.selectedDateTime));
      case ShiftDetailsEndDateChanged _:
        emit(state.copyWith(endDateTime: event.selectedDateTime));
    }
  }

  void _selectedDurationChanged(
    ShiftDetailsDurationChanged event,
    Emitter<ShiftDetailsState> emit,
  ) {
    emit(state.copyWith(breakDuration: event.selectedDuration));
  }
}
