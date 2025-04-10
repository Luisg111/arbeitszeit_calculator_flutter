import 'package:bloc/bloc.dart';

import 'shift_ical_import_event.dart';
import 'shift_ical_import_state.dart';

class ShiftIcalImportBloc
    extends Bloc<ShiftIcalImportEvent, ShiftIcalImportState> {
  ShiftIcalImportBloc() : super(ShiftIcalImportState());

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
