import 'package:arbeitszeit_calculator_flutter/feature/shift/presentation/shift_list/bloc/shift_list_event.dart';
import 'package:arbeitszeit_calculator_flutter/feature/shift/presentation/shift_list/view/date_selector.dart';
import 'package:arbeitszeit_calculator_flutter/widgets/app_bar.dart';

import '../bloc/shift_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/shift_list_state.dart';

class ShiftListScreen extends StatelessWidget {
  const ShiftListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShiftListBloc(),
      child: ShiftListView(),
    );
  }
}

class ShiftListView extends StatelessWidget {
  const ShiftListView({super.key});

  @override
  Widget build(BuildContext context) {
    ShiftListBloc bloc = context.read();
    return BlocBuilder<ShiftListBloc, ShiftListState>(
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(title: "Schichtübersicht"),
          body: ListView(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DateSelector(
                    initialValue: state.selectedYear,
                    isEntryValid: state.selectedYearValid,
                    onValueChanged: (value) {
                      bloc.add(ShiftListSelectedYearChanged(value));
                    },
                    inputHelper: "Jahr",
                  ),
                  DateSelector(
                    initialValue: state.selectedMonth,
                    isEntryValid: state.selectedMonthValid,
                    onValueChanged: (value) {
                      bloc.add(ShiftListSelectedMonthChanged(value));
                    },
                    inputHelper: "Monat",
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
