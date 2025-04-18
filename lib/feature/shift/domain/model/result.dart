
import "package:arbeitszeit_calculator_flutter/feature/shift/presentation/error_handler.dart";

/// Utility class that simplifies handling errors.
///
/// Return a [Result] from a function to indicate success or failure.
///
/// A [Result] is either an [Ok] with a value of type [T]
/// or a [Failure] with an [AppException].
///
/// Use [Result.ok] to create a successful result with a value of type [T].
/// Use [Result.failure] to create an error result with an [AppException].
sealed class Result<T> {
  const Result();

  /// Creates an instance of Result containing a value
  factory Result.ok(T value) => Ok(value);

  /// Create an instance of Result containing an error
  factory Result.failure(AppException error) => Failure(error);
}

/// Subclass of Result for values
final class Ok<T> extends Result<T> {
  const Ok(this.value);

  /// Returned value in result
  final T value;
}

/// Subclass of Result for errors
final class Failure<T> extends Result<T> {
  const Failure(this.error);

  /// Returned error in result
  final AppException error;
}
