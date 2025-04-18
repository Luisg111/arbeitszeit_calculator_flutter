import "package:arbeitszeit_calculator_flutter/feature/shift/domain/model/shift.dart";
import "package:copy_with_extension/copy_with_extension.dart";
import "package:equatable/equatable.dart";

part "shift_list_state.g.dart";

@CopyWith()
class ShiftListState extends Equatable {

  const ShiftListState({
    required this.selectedMonthValid, required this.selectedYearValid, required this.selectedYear, required this.selectedMonth, required this.shifts, required this.totalWorkTime, this.isLoading = false,
  });

  factory ShiftListState.empty() {
    final currentDate = DateTime.now();
    return ShiftListState(
      selectedYear: currentDate.year,
      selectedMonth: currentDate.month,
      selectedMonthValid: true,
      selectedYearValid: true,
      shifts: const [],
      totalWorkTime: Duration.zero,
    );
  }
  final bool isLoading;
  final int selectedYear;
  final int selectedMonth;

  final bool selectedYearValid;
  final bool selectedMonthValid;

  final List<Shift> shifts;
  final Duration totalWorkTime;

  @override
  List<Object?> get props => [
    isLoading,

    selectedYear,

    selectedMonth,

    selectedMonthValid,

    selectedYearValid,
    shifts,
    totalWorkTime,
  ];
}
