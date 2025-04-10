import 'package:bloc/bloc.dart';

import 'shift_list_event.dart';
import 'shift_list_state.dart';

class ShiftListBloc extends Bloc<ShiftListEvent, ShiftListState> {
  ShiftListBloc() : super(ShiftListState());

  @override
  void onEvent(ShiftListEvent event) {
    super.onEvent(event);

    switch (event) {
      case ShiftListInitialized():
        _initialize();
    }
  }

  Future<void> _initialize() async {}
}
