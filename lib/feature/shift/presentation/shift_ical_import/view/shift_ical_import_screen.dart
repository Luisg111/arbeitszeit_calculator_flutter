import "package:arbeitszeit_calculator_flutter/feature/shift/presentation/shift_ical_import/bloc/shift_ical_import_bloc.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

class ShiftIcalImportScreen extends StatelessWidget {
  const ShiftIcalImportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShiftIcalImportBloc(),
      child: const ShiftIcalImportView(),
    );
  }
}

class ShiftIcalImportView extends StatelessWidget {
  const ShiftIcalImportView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder(child: Text("ShiftIcalImport Placeholder"));
  }
}
