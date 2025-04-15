import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'shift_details_state.g.dart';

@CopyWith()
class ShiftDetailsState extends Equatable {
  final bool isLoading;
  final bool closeScreen;
  final int? shiftId;
  final Duration breakDuration;
  final DateTime startDateTime;
  final DateTime endDateTime;

  bool get isCreatingNewShift => shiftId == null;

  const ShiftDetailsState(
    this.isLoading,
    this.shiftId,
    this.breakDuration,
    this.startDateTime,
    this.endDateTime,
    this.closeScreen,
  );

  factory ShiftDetailsState.empty() {
    var dateTime = DateTime.now();
    return ShiftDetailsState(
      false,
      null,
      Duration(hours: 1),
      dateTime,
      dateTime.add(Duration(hours: 9)),
      false,
    );
  }

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
