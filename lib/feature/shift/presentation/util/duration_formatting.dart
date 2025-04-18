extension DurationFormatting on Duration {
  /// Converts the duration into a readable string
  /// 05:15
  String toHoursMinutes() {
    final twoDigitMinutes = _toTwoDigits(inMinutes.remainder(60));
    return "${_toTwoDigits(inHours)}h ${twoDigitMinutes}m";
  }

  /// Converts the duration into a readable string
  /// 05:15:35
  String toHoursMinutesSeconds() {
    final twoDigitMinutes = _toTwoDigits(inMinutes.remainder(60));
    final twoDigitSeconds = _toTwoDigits(inSeconds.remainder(60));
    return "${_toTwoDigits(inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  String _toTwoDigits(int n) {
    if (n >= 10) return "$n";
    return "0$n";
  }
}
