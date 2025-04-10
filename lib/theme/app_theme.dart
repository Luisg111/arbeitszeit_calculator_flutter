import 'package:flutter/material.dart';

ThemeData getAppTheme(BuildContext context) {
  var colorScheme = getAppColorScheme();
  return ThemeData.from(colorScheme: colorScheme, useMaterial3: true).copyWith(
    appBarTheme: AppBarTheme(
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
    ),
  );
}

ColorScheme getAppColorScheme() {
  return ColorScheme.fromSeed(seedColor: Colors.blueAccent);
}
