// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift_ical_import_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ShiftIcalImportStateCWProxy {
  ShiftIcalImportState isLoading(bool isLoading);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ShiftIcalImportState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ShiftIcalImportState(...).copyWith(id: 12, name: "My name")
  /// ````
  ShiftIcalImportState call({bool isLoading});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfShiftIcalImportState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfShiftIcalImportState.copyWith.fieldName(...)`
class _$ShiftIcalImportStateCWProxyImpl
    implements _$ShiftIcalImportStateCWProxy {
  const _$ShiftIcalImportStateCWProxyImpl(this._value);

  final ShiftIcalImportState _value;

  @override
  ShiftIcalImportState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ShiftIcalImportState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ShiftIcalImportState(...).copyWith(id: 12, name: "My name")
  /// ````
  ShiftIcalImportState call({
    Object? isLoading = const $CopyWithPlaceholder(),
  }) {
    return ShiftIcalImportState(
      isLoading:
          isLoading == const $CopyWithPlaceholder()
              ? _value.isLoading
              // ignore: cast_nullable_to_non_nullable
              : isLoading as bool,
    );
  }
}

extension $ShiftIcalImportStateCopyWith on ShiftIcalImportState {
  /// Returns a callable class that can be used as follows: `instanceOfShiftIcalImportState.copyWith(...)` or like so:`instanceOfShiftIcalImportState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ShiftIcalImportStateCWProxy get copyWith =>
      _$ShiftIcalImportStateCWProxyImpl(this);
}
