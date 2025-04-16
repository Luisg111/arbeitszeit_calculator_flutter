
import '../../presentation/error_handler.dart';

sealed class DatabaseException implements AppException {}

class DatabaseUnknownException implements DatabaseException {}

class DatabaseEntryNotFound implements DatabaseException {}
