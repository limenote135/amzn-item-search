class Either<T> {
  Either.ok(this.value)
      : exception = null,
        stackTrace = null;
  Either.error(this.exception, this.stackTrace) : value = null;

  final T? value;
  final Object? exception;
  final StackTrace? stackTrace;
}

Either<T> exceptionHandler<T>(T Function() f) {
  try {
    return Either<T>.ok(f());
    //ignore: avoid_catches_without_on_clauses
  } catch (e, st) {
    return Either<T>.error(e, st);
  }
}
