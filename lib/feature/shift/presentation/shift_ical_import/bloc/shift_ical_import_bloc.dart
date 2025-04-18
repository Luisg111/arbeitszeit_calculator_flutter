import "package:arbeitszeit_calculator_flutter/feature/shift/presentation/shift_ical_import/bloc/shift_ical_import_event.dart";
import "package:arbeitszeit_calculator_flutter/feature/shift/presentation/shift_ical_import/bloc/shift_ical_import_state.dart";
import "package:bloc/bloc.dart";

class ShiftIcalImportBloc
    extends Bloc<ShiftIcalImportEvent, ShiftIcalImportState> {
  ShiftIcalImportBloc() : super(const ShiftIcalImportState());

  @override
  void onEvent(ShiftIcalImportEvent event) {
    super.onEvent(event);

    switch (event) {
      case ShiftIcalImportInitialized():
        _initialize();
    }
  }

  Future<void> _initialize() async {}
}
