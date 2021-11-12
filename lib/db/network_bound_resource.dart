import 'dart:async';
import 'resource.dart';

class NetworkBoundResource<ResultType, RequestType> {
  Stream<Resource<ResultType>> asStream({
    required Stream<ResultType?> Function() query,
    required bool Function(ResultType? data) shouldFetch,
    required Future<RequestType> Function() fetch,
    required Future Function(RequestType item) saveFetchResult,
  }) async* {
    var data = query();

    print("Call loading...");

    if (shouldFetch(await data.first)) {
      yield Resource.loading();
      try {
        saveFetchResult(await fetch());
        yield* query().map((event) {
          return event != null
              ? Resource.success(data: event)
              : Resource.failure(err: Exception("Empty Data"));
        });
      } on Exception catch (e) {
        print(e);
        yield* query().map((event) => Resource.failure(err: e));
      }
    } else {
      yield* data.map((event) {
        return event != null
            ? Resource.success(data: event)
            : Resource.failure(err: Exception("Empty Data"));
      });
    }
  }
}
