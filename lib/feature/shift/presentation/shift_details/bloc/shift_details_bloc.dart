import 'package:arbeitszeit_calculator_flutter/feature/shift/presentation/error_handler.dart';
import 'package:arbeitszeit_calculator_flutter/feature/shift/domain/repository/shift_repository.dart';
import 'package:bloc/bloc.dart';

import '../../../domain/model/result.dart';
import '../../../domain/model/shift.dart';
import 'shift_details_event.dart';
import 'shift_details_state.dart';

class ShiftDetailsBloc extends Bloc<ShiftDetailsEvent, ShiftDetailsState> {
  final int? _initialId;
  final ShiftRepository _repository;
  final ErrorHandler _handler;

  ShiftDetailsBloc(this._initialId, this._repository, this._handler)
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

    var databaseResponse = await _repository.getShift(state.shiftId!);
    switch (databaseResponse) {
      case Ok<Shift> _:
        emit(
          state.copyWith(
            shiftId: databaseResponse.value.id,
            breakDuration: databaseResponse.value.breakTime,
            startDateTime: databaseResponse.value.startDate,
            endDateTime: databaseResponse.value.endDate,
          ),
        );
      case Failure<Shift> _:
        {
          _handler.handle(databaseResponse.error);
          emit(state.copyWith(closeScreen: true));
        }
    }

    emit(state.copyWith(isLoading: false));
  }

  Future<void> _storeShiftData(Emitter<ShiftDetailsState> emit) async {
    emit(state.copyWith(isLoading: true));

    var shift = Shift(
      id: state.shiftId,
      breakTime: state.breakDuration,
      startDate: state.startDateTime,
      endDate: state.endDateTime,
    );

    var databaseResponse = await _repository.storeShift(shift);
    switch (databaseResponse) {
      case Ok<int> _:
        emit(
          state.copyWith(shiftId: databaseResponse.value, closeScreen: true),
        );
      case Failure<int> _:
        _handler.handle(databaseResponse.error);
    }

    emit(state.copyWith(isLoading: false));
  }

  Future<void> _deleteShift(Emitter<ShiftDetailsState> emit) async {
    if (state.shiftId == null) {
      return;
    }

    emit(state.copyWith(isLoading: true));

    var databaseResponse = await _repository.deleteShift(state.shiftId!);
    switch (databaseResponse) {
      case Ok<int> _:
        emit(state.copyWith(closeScreen: true));
      case Failure<int> _:
        _handler.handle(databaseResponse.error);
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
