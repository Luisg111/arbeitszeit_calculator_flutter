import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'shift_list_state.g.dart';

@CopyWith()
class ShiftListState extends Equatable {
  final bool isLoading;

  ShiftListState({this.isLoading = false});

  @override
  List<Object?> get props => [isLoading];
}
