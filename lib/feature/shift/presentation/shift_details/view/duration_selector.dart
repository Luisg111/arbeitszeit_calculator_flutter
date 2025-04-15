import 'package:flutter/material.dart';

class DurationSelector extends StatelessWidget {
  const DurationSelector({
    super.key,
    this.selectedDuration,
    this.onDurationChanged,
  });

  final Duration? selectedDuration;
  final void Function(Duration duration)? onDurationChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {},
      child: InputDecorator(
        decoration: InputDecoration(label: Text("Pause")),
        child: buildDateText(),
      ),
    );
  }

  Widget buildDateText() {
    if (selectedDuration != null) {
      return Text(selectedDuration.toString());
    } else {
      return Text("Pausendauer auswählen");
    }
  }
}
