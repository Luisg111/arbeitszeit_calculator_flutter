import 'dart:async';

import 'package:arbeitszeit_calculator_flutter/feature/shift/domain/exception/database_exception.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppException {}

class ErrorHandler {
  final StreamController<AppException> _errorStreamController =
      StreamController.broadcast();

  Stream<AppException> get errorStream => _errorStreamController.stream;

  void handle(AppException exception) {
    _errorStreamController.add(exception);
  }

  void dispose() {
    _errorStreamController.close();
  }
}

class ErrorHandlerProvider extends StatefulWidget {
  const ErrorHandlerProvider({super.key, required this.child});

  final Widget child;

  @override
  State<ErrorHandlerProvider> createState() => _ErrorHandlerProviderState();
}

class _ErrorHandlerProviderState extends State<ErrorHandlerProvider> {
  late final ErrorHandler _handler = ErrorHandler();

  @override
  void initState() {
    _handler.errorStream.listen((error) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(getErrorMessage(error))));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provider.value(value: _handler, child: widget.child);
  }

  @override
  void dispose() {
    _handler.dispose();
    super.dispose();
  }
}

String getErrorMessage(AppException exception) {
  switch (exception) {
    case DatabaseException exception:
      return switch (exception) {
        DatabaseEntryNotFound() => "Datenbankeintrag nicht gefunden",
        DatabaseUnknownException() => "Unbekannter Fehler",
      };
  }
  return "Unbekannter Fehler";
}
