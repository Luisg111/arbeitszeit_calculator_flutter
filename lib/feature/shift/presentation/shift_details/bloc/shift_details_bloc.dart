import 'package:bloc/bloc.dart';

import 'shift_details_event.dart';
import 'shift_details_state.dart';

class ShiftDetailsBloc extends Bloc<ShiftDetailsEvent, ShiftDetailsState> {
  ShiftDetailsBloc() : super(ShiftDetailsState());

  @override
  void onEvent(ShiftDetailsEvent event) {
    super.onEvent(event);

    switch (event) {
      case ShiftDetailsInitialized():
        _initialize();
    }
  }

  Future<void> _initialize() async {}
}
