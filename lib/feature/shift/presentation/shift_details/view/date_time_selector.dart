import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeSelector extends StatelessWidget {
  const DateTimeSelector({
    super.key,
    this.selectedDateTime,
    this.onDateTimeChanged,
    required this.label,
  });

  final DateTime? selectedDateTime;
  final void Function(DateTime dateTime)? onDateTimeChanged;

  final String label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        var selectedDate = await showDatePicker(
          context: context,
          firstDate: DateTime(2000, 1, 1),
          lastDate: DateTime.now().add(Duration(days: 365)),
          initialDate: selectedDateTime,
          initialEntryMode: DatePickerEntryMode.input,
        );

        var selectedTime =
            context.mounted
                ? await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.fromDateTime(
                    selectedDateTime ?? DateTime.now(),
                  ),
                  initialEntryMode: TimePickerEntryMode.input,
                )
                : null;

        if (selectedDate != null && selectedTime != null) {
          onDateTimeChanged?.call(
            DateTime(
              selectedDate.year,
              selectedDate.month,
              selectedDate.day,
              selectedTime.hour,
              selectedTime.minute,
            ),
          );
        }
      },
      child: InputDecorator(
        decoration: InputDecoration(label: Text(label)),
        child: buildDateText(),
      ),
    );
  }

  Widget buildDateText() {
    if (selectedDateTime != null) {
      return Text(
        "${DateFormat.yMMMMEEEEd().format(selectedDateTime!)} - ${DateFormat.Hm().format(selectedDateTime!)} Uhr",
      );
    } else {
      return Text("Datum auswählen");
    }
  }
}
