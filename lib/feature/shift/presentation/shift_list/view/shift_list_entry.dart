import 'package:arbeitszeit_calculator_flutter/feature/shift/presentation/util/duration_formatting.dart';
import 'package:arbeitszeit_calculator_flutter/navigation/app_navigation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../domain/model/shift.dart';

class ShiftListEntry extends StatelessWidget {
  const ShiftListEntry({super.key, required this.shift});

  final Shift shift;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        onTap: () {
          if (shift.id != null) {
            ShiftDetailsRoute(shift.id!).go(context);
          }
        },
        tileColor: theme.colorScheme.primary,
        textColor: theme.colorScheme.onPrimary,
        title: Text(DateFormat.yMMMMd().format(shift.startDate)),
        subtitle: Text(
          "${DateFormat.Hm().format(shift.startDate)} - ${DateFormat.Hm().format(shift.endDate)}",
        ),
        trailing: Text(shift.workTime.toHoursMinutes()),
      ),
    );
  }
}
