import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'shift_ical_import_state.g.dart';

@CopyWith()
class ShiftIcalImportState extends Equatable {
  final bool isLoading;

  ShiftIcalImportState({this.isLoading = false});

  @override
  List<Object?> get props => [isLoading];
}
