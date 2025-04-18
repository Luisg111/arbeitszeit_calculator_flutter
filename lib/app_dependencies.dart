import "package:arbeitszeit_calculator_flutter/feature/shift/data/database.dart";
import "package:arbeitszeit_calculator_flutter/feature/shift/domain/repository/shift_repository.dart";
import "package:arbeitszeit_calculator_flutter/feature/shift/presentation/error_handler.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

class AppDependencies extends StatelessWidget {
  const AppDependencies({required this.app, super.key});

  final Widget app;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => Database()),
        Provider(create: (context) => ShiftRepository(db: context.read())),
        Provider(create: (context) => ErrorHandler()),
      ],
      child: app,
    );
  }
}
