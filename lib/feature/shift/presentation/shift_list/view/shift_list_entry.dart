import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../domain/model/shift.dart';

class ShiftListEntry extends StatelessWidget {
  const ShiftListEntry({super.key, required this.shift});

  final Shift shift;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ListTile(
      tileColor: theme.colorScheme.primary,
      textColor: theme.colorScheme.onPrimary,
      title: Text(DateFormat.yMMMMd().format(shift.startDate)),
      subtitle: Text(
        "${DateFormat.Hm().format(shift.startDate)} - ${DateFormat.Hm().format(shift.startDate)}",
      ),
    );
  }
}
