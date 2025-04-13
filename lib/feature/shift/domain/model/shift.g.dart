// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ShiftCWProxy {
  Shift id(int id);

  Shift startDate(DateTime startDate);

  Shift endDate(DateTime endDate);

  Shift breakTime(Duration breakTime);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Shift(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Shift(...).copyWith(id: 12, name: "My name")
  /// ````
  Shift call({
    int id,
    DateTime startDate,
    DateTime endDate,
    Duration breakTime,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfShift.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfShift.copyWith.fieldName(...)`
class _$ShiftCWProxyImpl implements _$ShiftCWProxy {
  const _$ShiftCWProxyImpl(this._value);

  final Shift _value;

  @override
  Shift id(int id) => this(id: id);

  @override
  Shift startDate(DateTime startDate) => this(startDate: startDate);

  @override
  Shift endDate(DateTime endDate) => this(endDate: endDate);

  @override
  Shift breakTime(Duration breakTime) => this(breakTime: breakTime);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Shift(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Shift(...).copyWith(id: 12, name: "My name")
  /// ````
  Shift call({
    Object? id = const $CopyWithPlaceholder(),
    Object? startDate = const $CopyWithPlaceholder(),
    Object? endDate = const $CopyWithPlaceholder(),
    Object? breakTime = const $CopyWithPlaceholder(),
  }) {
    return Shift(
      id:
          id == const $CopyWithPlaceholder()
              ? _value.id
              // ignore: cast_nullable_to_non_nullable
              : id as int,
      startDate:
          startDate == const $CopyWithPlaceholder()
              ? _value.startDate
              // ignore: cast_nullable_to_non_nullable
              : startDate as DateTime,
      endDate:
          endDate == const $CopyWithPlaceholder()
              ? _value.endDate
              // ignore: cast_nullable_to_non_nullable
              : endDate as DateTime,
      breakTime:
          breakTime == const $CopyWithPlaceholder()
              ? _value.breakTime
              // ignore: cast_nullable_to_non_nullable
              : breakTime as Duration,
    );
  }
}

extension $ShiftCopyWith on Shift {
  /// Returns a callable class that can be used as follows: `instanceOfShift.copyWith(...)` or like so:`instanceOfShift.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ShiftCWProxy get copyWith => _$ShiftCWProxyImpl(this);
}
