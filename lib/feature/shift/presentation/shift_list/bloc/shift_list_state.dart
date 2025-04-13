import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'shift_list_state.g.dart';

@CopyWith()
class ShiftListState extends Equatable {
  final bool isLoading;
  final int selectedYear;
  final int selectedMonth;

  final bool selectedYearValid;
  final bool selectedMonthValid;

  const ShiftListState({
    this.isLoading = false,
    required this.selectedMonthValid,
    required this.selectedYearValid,
    required this.selectedYear,
    required this.selectedMonth,
  });

  factory ShiftListState.empty() {
    var currentDate = DateTime.now();
    return ShiftListState(
      selectedYear: currentDate.year,
      selectedMonth: currentDate.month,
      selectedMonthValid: true,
      selectedYearValid: true,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,

    selectedYear,

    selectedMonth,

    selectedMonthValid,

    selectedYearValid,
  ];
}
