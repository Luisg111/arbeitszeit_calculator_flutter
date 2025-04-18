import "package:arbeitszeit_calculator_flutter/feature/shift/presentation/util/duration_formatting.dart";
import "package:flutter/material.dart";

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
        decoration: const InputDecoration(label: Text("Pause")),
        child: buildDateText(),
      ),
    );
  }

  Widget buildDateText() {
    if (selectedDuration != null) {
      return Text(selectedDuration!.toHoursMinutes());
    } else {
      return const Text("Pausendauer auswählen");
    }
  }
}
