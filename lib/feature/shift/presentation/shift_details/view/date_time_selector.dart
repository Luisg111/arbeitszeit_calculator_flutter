import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeSelector extends StatelessWidget {
  const DateTimeSelector({
    super.key,
    this.value,
    this.onDateTimeChanged,
    required this.label,
  });

  final DateTime? value;
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
          initialDate: value,
          initialEntryMode: DatePickerEntryMode.input,
        );

        if (selectedDate == null) {
          return;
        }

        var selectedTime =
            context.mounted
                ? await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.fromDateTime(
                    value ?? DateTime.now(),
                  ),
                  initialEntryMode: TimePickerEntryMode.input,
                )
                : null;

        if (selectedTime == null) {
          return;
        }

        onDateTimeChanged?.call(
          DateTime(
            selectedDate.year,
            selectedDate.month,
            selectedDate.day,
            selectedTime.hour,
            selectedTime.minute,
          ),
        );
      },
      child: InputDecorator(
        decoration: InputDecoration(label: Text(label)),
        child: buildDateText(),
      ),
    );
  }

  Widget buildDateText() {
    if (value != null) {
      return Text(
        "${DateFormat.yMMMMEEEEd().format(value!)} - ${DateFormat.Hm().format(value!)} Uhr",
      );
    } else {
      return Text("Datum auswählen");
    }
  }
}
