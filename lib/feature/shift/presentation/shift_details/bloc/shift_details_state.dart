import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'shift_details_state.g.dart';

@CopyWith()
class ShiftDetailsState extends Equatable {
  final bool isLoading;

  ShiftDetailsState({this.isLoading = false});

  @override
  List<Object?> get props => [isLoading];
}
