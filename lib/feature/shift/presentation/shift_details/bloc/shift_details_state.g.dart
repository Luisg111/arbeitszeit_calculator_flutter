// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift_details_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ShiftDetailsStateCWProxy {
  ShiftDetailsState isLoading(bool isLoading);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ShiftDetailsState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ShiftDetailsState(...).copyWith(id: 12, name: "My name")
  /// ````
  ShiftDetailsState call({bool isLoading});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfShiftDetailsState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfShiftDetailsState.copyWith.fieldName(...)`
class _$ShiftDetailsStateCWProxyImpl implements _$ShiftDetailsStateCWProxy {
  const _$ShiftDetailsStateCWProxyImpl(this._value);

  final ShiftDetailsState _value;

  @override
  ShiftDetailsState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ShiftDetailsState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ShiftDetailsState(...).copyWith(id: 12, name: "My name")
  /// ````
  ShiftDetailsState call({Object? isLoading = const $CopyWithPlaceholder()}) {
    return ShiftDetailsState(
      isLoading:
          isLoading == const $CopyWithPlaceholder()
              ? _value.isLoading
              // ignore: cast_nullable_to_non_nullable
              : isLoading as bool,
    );
  }
}

extension $ShiftDetailsStateCopyWith on ShiftDetailsState {
  /// Returns a callable class that can be used as follows: `instanceOfShiftDetailsState.copyWith(...)` or like so:`instanceOfShiftDetailsState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ShiftDetailsStateCWProxy get copyWith =>
      _$ShiftDetailsStateCWProxyImpl(this);
}
