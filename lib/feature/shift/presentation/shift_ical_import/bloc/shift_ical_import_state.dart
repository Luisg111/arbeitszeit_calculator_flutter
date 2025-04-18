import "package:copy_with_extension/copy_with_extension.dart";
import "package:equatable/equatable.dart";

part "shift_ical_import_state.g.dart";

@CopyWith()
class ShiftIcalImportState extends Equatable {

  const ShiftIcalImportState({this.isLoading = false});
  final bool isLoading;

  @override
  List<Object?> get props => [isLoading];
}
