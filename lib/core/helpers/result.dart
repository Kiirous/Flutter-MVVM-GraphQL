sealed class Result<E, S> {
  const Result();
}

final class Success<E, S> extends Result<E, S> {
  const Success(this.value) : super();

  final S value;
}

final class Failure<E, S> extends Result<E, S> {
  const Failure(this.exception) : super();

  final E exception;
}