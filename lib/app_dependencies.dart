import 'package:arbeitszeit_calculator_flutter/shift/data/database.dart';
import 'package:arbeitszeit_calculator_flutter/shift/domain/repository/shift_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppDependencies extends StatelessWidget {
  const AppDependencies({super.key, required this.app});

  final Widget app;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => Database()),
        Provider(create: (context) => ShiftRepository(db: context.read())),
      ],
      child: app,
    );
  }
}
