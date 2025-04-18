
import "package:arbeitszeit_calculator_flutter/feature/shift/presentation/error_handler.dart";

sealed class DatabaseException implements AppException {}

class DatabaseUnknownException implements DatabaseException {}

class DatabaseEntryNotFound implements DatabaseException {}
