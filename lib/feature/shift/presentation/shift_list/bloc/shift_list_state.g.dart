// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift_list_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ShiftListStateCWProxy {
  ShiftListState isLoading(bool isLoading);

  ShiftListState selectedMonthValid(bool selectedMonthValid);

  ShiftListState selectedYearValid(bool selectedYearValid);

  ShiftListState selectedYear(int selectedYear);

  ShiftListState selectedMonth(int selectedMonth);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ShiftListState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ShiftListState(...).copyWith(id: 12, name: "My name")
  /// ````
  ShiftListState call({
    bool isLoading,
    bool selectedMonthValid,
    bool selectedYearValid,
    int selectedYear,
    int selectedMonth,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfShiftListState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfShiftListState.copyWith.fieldName(...)`
class _$ShiftListStateCWProxyImpl implements _$ShiftListStateCWProxy {
  const _$ShiftListStateCWProxyImpl(this._value);

  final ShiftListState _value;

  @override
  ShiftListState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  ShiftListState selectedMonthValid(bool selectedMonthValid) =>
      this(selectedMonthValid: selectedMonthValid);

  @override
  ShiftListState selectedYearValid(bool selectedYearValid) =>
      this(selectedYearValid: selectedYearValid);

  @override
  ShiftListState selectedYear(int selectedYear) =>
      this(selectedYear: selectedYear);

  @override
  ShiftListState selectedMonth(int selectedMonth) =>
      this(selectedMonth: selectedMonth);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ShiftListState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ShiftListState(...).copyWith(id: 12, name: "My name")
  /// ````
  ShiftListState call({
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? selectedMonthValid = const $CopyWithPlaceholder(),
    Object? selectedYearValid = const $CopyWithPlaceholder(),
    Object? selectedYear = const $CopyWithPlaceholder(),
    Object? selectedMonth = const $CopyWithPlaceholder(),
  }) {
    return ShiftListState(
      isLoading:
          isLoading == const $CopyWithPlaceholder()
              ? _value.isLoading
              // ignore: cast_nullable_to_non_nullable
              : isLoading as bool,
      selectedMonthValid:
          selectedMonthValid == const $CopyWithPlaceholder()
              ? _value.selectedMonthValid
              // ignore: cast_nullable_to_non_nullable
              : selectedMonthValid as bool,
      selectedYearValid:
          selectedYearValid == const $CopyWithPlaceholder()
              ? _value.selectedYearValid
              // ignore: cast_nullable_to_non_nullable
              : selectedYearValid as bool,
      selectedYear:
          selectedYear == const $CopyWithPlaceholder()
              ? _value.selectedYear
              // ignore: cast_nullable_to_non_nullable
              : selectedYear as int,
      selectedMonth:
          selectedMonth == const $CopyWithPlaceholder()
              ? _value.selectedMonth
              // ignore: cast_nullable_to_non_nullable
              : selectedMonth as int,
    );
  }
}

extension $ShiftListStateCopyWith on ShiftListState {
  /// Returns a callable class that can be used as follows: `instanceOfShiftListState.copyWith(...)` or like so:`instanceOfShiftListState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ShiftListStateCWProxy get copyWith => _$ShiftListStateCWProxyImpl(this);
}
