import 'package:arbeitszeit_calculator_flutter/arbeitszeit_calculator_app.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/find_locale.dart';
import 'package:intl/intl.dart';

void main() {
  initialize().then((_) => runApp(const ArbeitszeitCalculatorApp()));
}

Future<void> initialize() async {
  await findSystemLocale();
  await initializeDateFormatting();
}
