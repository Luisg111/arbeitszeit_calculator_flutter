import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part "shift.g.dart";

@CopyWith()
class Shift extends Equatable {
  final int id;
  final DateTime startDate;
  final DateTime endDate;

  Shift({required this.id, required this.startDate, required this.endDate});

  @override
  List<Object?> get props => [id, startDate, endDate];
}
