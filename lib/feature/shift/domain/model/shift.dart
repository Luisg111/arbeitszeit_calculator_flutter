import "package:copy_with_extension/copy_with_extension.dart";
import "package:equatable/equatable.dart";

part "shift.g.dart";

@CopyWith()
class Shift extends Equatable {

  const Shift({
    required this.id,
    required this.startDate,
    required this.endDate,
    required this.breakTime,
  });
  final int? id;
  final Duration breakTime;
  final DateTime startDate;
  final DateTime endDate;

  Duration get workTime => startDate.difference(endDate).abs() - breakTime;

  @override
  List<Object?> get props => [id, startDate, endDate, breakTime];
}
