import "package:arbeitszeit_calculator_flutter/feature/shift/presentation/error_handler.dart";
import "package:arbeitszeit_calculator_flutter/feature/shift/presentation/shift_list/bloc/shift_list_bloc.dart";
import "package:arbeitszeit_calculator_flutter/feature/shift/presentation/shift_list/bloc/shift_list_event.dart";
import "package:arbeitszeit_calculator_flutter/feature/shift/presentation/shift_list/bloc/shift_list_state.dart";
import "package:arbeitszeit_calculator_flutter/feature/shift/presentation/shift_list/view/date_selector.dart";
import "package:arbeitszeit_calculator_flutter/feature/shift/presentation/shift_list/view/shift_list_entry.dart";
import "package:arbeitszeit_calculator_flutter/feature/shift/presentation/util/duration_formatting.dart";
import "package:arbeitszeit_calculator_flutter/navigation/app_navigation.dart";
import "package:arbeitszeit_calculator_flutter/navigation/route_observer.dart";
import "package:arbeitszeit_calculator_flutter/widgets/app_bar.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

class ShiftListScreen extends StatelessWidget {
  const ShiftListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ErrorHandlerProvider(
      child: BlocProvider(
        create:
            (context) =>
                ShiftListBloc(context.read(), context.read())
                  ..add(ShiftListInitialized()),
        child: const ShiftListView(),
      ),
    );
  }
}

class ShiftListView extends StatefulWidget {
  const ShiftListView({super.key});

  @override
  State<ShiftListView> createState() => _ShiftListViewState();
}

class _ShiftListViewState extends State<ShiftListView> with RouteAware {
  late final ShiftListBloc bloc = context.read();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Subscribe to RouteObserver
    if (ModalRoute.of(context)?.settings.name != null) {
      routeObserver.subscribe(this, ModalRoute.of(context)! as PageRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShiftListBloc, ShiftListState>(
      builder: (context, state) {
        final theme = Theme.of(context);
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              const ShiftCreateRoute().go(context);
            },
          ),
          appBar: const CustomAppBar(title: "Schichtübersicht"),
          body: ListView(
            children: [
              const SizedBox(height: 16),
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
              const SizedBox(height: 16),
              if (state.isLoading)
                const Center(child: CircularProgressIndicator())
              else ...[
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Text(
                        "Monatsarbeitszeit:",
                        style: theme.textTheme.labelLarge,
                      ),
                      Expanded(
                        child: Text(
                          state.totalWorkTime.toHoursMinutes(),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                ),
                for (final item in state.shifts) ShiftListEntry(shift: item),
              ],
            ],
          ),
        );
      },
    );
  }

  @override
  void didPopNext() {
    bloc.add(ShiftListRefresh());
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }
}
