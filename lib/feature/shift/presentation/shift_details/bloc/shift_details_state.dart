import "package:copy_with_extension/copy_with_extension.dart";
import "package:equatable/equatable.dart";

part "shift_details_state.g.dart";

@CopyWith()
class ShiftDetailsState extends Equatable {
  const ShiftDetailsState({
    required this.isLoading,
    required this.shiftId,
    required this.breakDuration,
    required this.startDateTime,
    required this.endDateTime,
    required this.closeScreen,
  });

  factory ShiftDetailsState.empty() {
    final dateTime = DateTime.now();
    return ShiftDetailsState(
      isLoading: false,
      shiftId: null,
      breakDuration: const Duration(hours: 1),
      startDateTime: dateTime,
      endDateTime: dateTime.add(const Duration(hours: 9)),
      closeScreen: false,
    );
  }

  final bool isLoading;
  final bool closeScreen;
  final int? shiftId;
  final Duration breakDuration;
  final DateTime startDateTime;
  final DateTime endDateTime;

  bool get isCreatingNewShift => shiftId == null;

  @override
  List<Object?> get props => [
    isLoading,
    shiftId,
    breakDuration,
    startDateTime,
    endDateTime,
    closeScreen,
  ];
}
