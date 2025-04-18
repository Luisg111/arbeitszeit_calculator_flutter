// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift_details_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ShiftDetailsStateCWProxy {
  ShiftDetailsState isLoading(bool isLoading);

  ShiftDetailsState shiftId(int? shiftId);

  ShiftDetailsState breakDuration(Duration breakDuration);

  ShiftDetailsState startDateTime(DateTime startDateTime);

  ShiftDetailsState endDateTime(DateTime endDateTime);

  ShiftDetailsState closeScreen(bool closeScreen);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ShiftDetailsState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ShiftDetailsState(...).copyWith(id: 12, name: "My name")
  /// ````
  ShiftDetailsState call({
    bool isLoading,
    int? shiftId,
    Duration breakDuration,
    DateTime startDateTime,
    DateTime endDateTime,
    bool closeScreen,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfShiftDetailsState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfShiftDetailsState.copyWith.fieldName(...)`
class _$ShiftDetailsStateCWProxyImpl implements _$ShiftDetailsStateCWProxy {
  const _$ShiftDetailsStateCWProxyImpl(this._value);

  final ShiftDetailsState _value;

  @override
  ShiftDetailsState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  ShiftDetailsState shiftId(int? shiftId) => this(shiftId: shiftId);

  @override
  ShiftDetailsState breakDuration(Duration breakDuration) =>
      this(breakDuration: breakDuration);

  @override
  ShiftDetailsState startDateTime(DateTime startDateTime) =>
      this(startDateTime: startDateTime);

  @override
  ShiftDetailsState endDateTime(DateTime endDateTime) =>
      this(endDateTime: endDateTime);

  @override
  ShiftDetailsState closeScreen(bool closeScreen) =>
      this(closeScreen: closeScreen);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ShiftDetailsState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ShiftDetailsState(...).copyWith(id: 12, name: "My name")
  /// ````
  ShiftDetailsState call({
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? shiftId = const $CopyWithPlaceholder(),
    Object? breakDuration = const $CopyWithPlaceholder(),
    Object? startDateTime = const $CopyWithPlaceholder(),
    Object? endDateTime = const $CopyWithPlaceholder(),
    Object? closeScreen = const $CopyWithPlaceholder(),
  }) {
    return ShiftDetailsState(
      isLoading:
          isLoading == const $CopyWithPlaceholder()
              ? _value.isLoading
              // ignore: cast_nullable_to_non_nullable
              : isLoading as bool,
      shiftId:
          shiftId == const $CopyWithPlaceholder()
              ? _value.shiftId
              // ignore: cast_nullable_to_non_nullable
              : shiftId as int?,
      breakDuration:
          breakDuration == const $CopyWithPlaceholder()
              ? _value.breakDuration
              // ignore: cast_nullable_to_non_nullable
              : breakDuration as Duration,
      startDateTime:
          startDateTime == const $CopyWithPlaceholder()
              ? _value.startDateTime
              // ignore: cast_nullable_to_non_nullable
              : startDateTime as DateTime,
      endDateTime:
          endDateTime == const $CopyWithPlaceholder()
              ? _value.endDateTime
              // ignore: cast_nullable_to_non_nullable
              : endDateTime as DateTime,
      closeScreen:
          closeScreen == const $CopyWithPlaceholder()
              ? _value.closeScreen
              // ignore: cast_nullable_to_non_nullable
              : closeScreen as bool,
    );
  }
}

extension $ShiftDetailsStateCopyWith on ShiftDetailsState {
  /// Returns a callable class that can be used as follows: `instanceOfShiftDetailsState.copyWith(...)` or like so:`instanceOfShiftDetailsState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ShiftDetailsStateCWProxy get copyWith =>
      _$ShiftDetailsStateCWProxyImpl(this);
}
