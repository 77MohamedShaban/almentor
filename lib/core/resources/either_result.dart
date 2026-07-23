sealed class EitherResult<T> {}

class Success<T> extends EitherResult<T>{
  T response;
  Success(this.response);
}

class Failure<T> extends EitherResult<T>{
  String message;
  Failure(this.message);
}