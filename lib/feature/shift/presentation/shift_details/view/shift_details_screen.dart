import 'package:arbeitszeit_calculator_flutter/feature/shift/presentation/shift_details/bloc/shift_details_event.dart';
import 'package:arbeitszeit_calculator_flutter/feature/shift/presentation/shift_details/view/date_time_selector.dart';
import 'package:arbeitszeit_calculator_flutter/navigation/app_navigation.dart';
import 'package:go_router/go_router.dart';

import '../../../../../widgets/app_bar.dart';
import '../bloc/shift_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/shift_details_state.dart';

class ShiftDetailsScreen extends StatelessWidget {
  const ShiftDetailsScreen({super.key, this.shiftId});

  final int? shiftId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              ShiftDetailsBloc(shiftId, context.read())
                ..add(ShiftDetailsInitialized()),
      child: ShiftDetailsView(),
    );
  }
}

class ShiftDetailsView extends StatelessWidget {
  const ShiftDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    ShiftDetailsBloc bloc = context.read();
    return BlocConsumer<ShiftDetailsBloc, ShiftDetailsState>(
      listener: (context, state) {
        if (context.canPop()) {
          context.pop();
        } else {
          ShiftListRoute().go(context);
        }
      },
      listenWhen: (oldState, newState) {
        return oldState.closeScreen == false && newState.closeScreen == true;
      },
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
            title:
                state.isCreatingNewShift
                    ? "neue Schicht erstellen"
                    : "Schichtdetails",
            actions: [
              if (state.shiftId != null)
                IconButton(
                  onPressed: () {
                    bloc.add(ShiftDetailsDeleteShift());
                  },
                  icon: Icon(Icons.delete),
                ),
            ],
          ),
          body: buildBody(context, state),
        );
      },
    );
  }

  Widget buildBody(BuildContext context, ShiftDetailsState state) {
    ShiftDetailsBloc bloc = context.read();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          DateTimeSelector(
            label: "Startzeitpunkt",
            selectedDateTime: state.startDateTime,
            onDateTimeChanged: (dateTime) {
              bloc.add(ShiftDetailsStartDateChanged(dateTime));
            },
          ),
          SizedBox(height: 16),
          DateTimeSelector(
            label: "Endzeitpunkt",
            selectedDateTime: state.endDateTime,
            onDateTimeChanged: (dateTime) {
              bloc.add(ShiftDetailsEndDateChanged(dateTime));
            },
          ),
        ],
      ),
    );
  }
}
