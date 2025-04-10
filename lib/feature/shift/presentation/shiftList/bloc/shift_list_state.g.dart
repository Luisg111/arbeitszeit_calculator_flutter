// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift_list_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ShiftListStateCWProxy {
  ShiftListState isLoading(bool isLoading);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ShiftListState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ShiftListState(...).copyWith(id: 12, name: "My name")
  /// ````
  ShiftListState call({bool isLoading});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfShiftListState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfShiftListState.copyWith.fieldName(...)`
class _$ShiftListStateCWProxyImpl implements _$ShiftListStateCWProxy {
  const _$ShiftListStateCWProxyImpl(this._value);

  final ShiftListState _value;

  @override
  ShiftListState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ShiftListState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ShiftListState(...).copyWith(id: 12, name: "My name")
  /// ````
  ShiftListState call({Object? isLoading = const $CopyWithPlaceholder()}) {
    return ShiftListState(
      isLoading:
          isLoading == const $CopyWithPlaceholder()
              ? _value.isLoading
              // ignore: cast_nullable_to_non_nullable
              : isLoading as bool,
    );
  }
}

extension $ShiftListStateCopyWith on ShiftListState {
  /// Returns a callable class that can be used as follows: `instanceOfShiftListState.copyWith(...)` or like so:`instanceOfShiftListState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ShiftListStateCWProxy get copyWith => _$ShiftListStateCWProxyImpl(this);
}
