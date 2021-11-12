enum Status { loading, success, failure }

class Resource<T> {
  final Status status;
  final T? data;
  final Exception? err;

  Resource({required this.status, this.data, this.err});

  static Resource<T> loading<T>() =>
      Resource<T>(data: null, status: Status.loading);

  static Resource<T> success<T>({required T data}) =>
      Resource<T>(data: data, status: Status.success);

  static Resource<T> failure<T>({required Exception err}) =>
      Resource<T>(data: null, err: err, status: Status.failure);

  bool get isLoading => status == Status.loading;
  bool get isError => status == Status.failure;
  bool get isSuccess => status == Status.success;
}
