import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'feature/shift/data/database.dart';
import 'feature/shift/domain/repository/shift_repository.dart';

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
