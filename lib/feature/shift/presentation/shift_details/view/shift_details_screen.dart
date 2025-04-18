import "package:arbeitszeit_calculator_flutter/feature/shift/presentation/error_handler.dart";
import "package:arbeitszeit_calculator_flutter/feature/shift/presentation/shift_details/bloc/shift_details_bloc.dart";
import "package:arbeitszeit_calculator_flutter/feature/shift/presentation/shift_details/bloc/shift_details_event.dart";
import "package:arbeitszeit_calculator_flutter/feature/shift/presentation/shift_details/bloc/shift_details_state.dart";
import "package:arbeitszeit_calculator_flutter/feature/shift/presentation/shift_details/view/date_time_selector.dart";
import "package:arbeitszeit_calculator_flutter/feature/shift/presentation/shift_details/view/duration_selector.dart";
import "package:arbeitszeit_calculator_flutter/feature/shift/presentation/util/delete_confirmation_dialog.dart";
import "package:arbeitszeit_calculator_flutter/navigation/app_navigation.dart";
import "package:arbeitszeit_calculator_flutter/widgets/app_bar.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:go_router/go_router.dart";

class ShiftDetailsScreen extends StatelessWidget {
  const ShiftDetailsScreen({super.key, this.shiftId});

  final int? shiftId;

  @override
  Widget build(BuildContext context) {
    return ErrorHandlerProvider(
      child: BlocProvider(
        create:
            (context) =>
                ShiftDetailsBloc(shiftId, context.read(), context.read())
                  ..add(ShiftDetailsInitialized()),
        child: const ShiftDetailsView(),
      ),
    );
  }
}

class ShiftDetailsView extends StatelessWidget {
  const ShiftDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ShiftDetailsBloc>();
    return BlocConsumer<ShiftDetailsBloc, ShiftDetailsState>(
      listener: (context, state) {
        if (context.canPop()) {
          context.pop();
        } else {
          const ShiftListRoute().go(context);
        }
      },
      listenWhen: (oldState, newState) {
        return !oldState.closeScreen && newState.closeScreen;
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
                  onPressed: () async {
                    if (await showDeleteConfirmDialog(context) ?? false) {
                      bloc.add(ShiftDetailsDeleteShift());
                    }
                  },
                  icon: const Icon(Icons.delete),
                ),
            ],
          ),
          body:
              (state.isLoading)
                  ? const Center(child: CircularProgressIndicator())
                  : buildBody(context, state),
        );
      },
    );
  }

  Widget buildBody(BuildContext context, ShiftDetailsState state) {
    final bloc = context.read<ShiftDetailsBloc>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          DateTimeSelector(
            label: "Startzeitpunkt",
            value: state.startDateTime,
            onDateTimeChanged: (dateTime) {
              bloc.add(ShiftDetailsStartDateChanged(dateTime));
            },
          ),
          const SizedBox(height: 16),
          DateTimeSelector(
            label: "Endzeitpunkt",
            value: state.endDateTime,
            onDateTimeChanged: (dateTime) {
              bloc.add(ShiftDetailsEndDateChanged(dateTime));
            },
          ),
          const SizedBox(height: 16),
          DurationSelector(
            selectedDuration: state.breakDuration,
            onDurationChanged: (duration) {
              bloc.add(ShiftDetailsDurationChanged(duration));
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              bloc.add(ShiftDetailsStoreShift());
            },
            child: const Text("Speichern"),
          ),
        ],
      ),
    );
  }
}
