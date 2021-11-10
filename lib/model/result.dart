abstract class Result<T> {}

abstract class Error extends Result<String> {
  String? error;
  Error({this.error});
}

abstract class Success<T> extends Result<T> {
  T? data;
  Success({this.data});
}