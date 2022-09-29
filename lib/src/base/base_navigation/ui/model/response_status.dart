enum Status {
  Loading,
  Success,
  Error,
}

class RequestStatus<T> {
  final Status status;
  final T? payload;

  RequestStatus({
    required this.status,
    this.payload,
  });

  factory RequestStatus.loading() {
    return RequestStatus(status: Status.Loading);
  }
  factory RequestStatus.success([T? payload]) {
    return RequestStatus<T>(
      status: Status.Success,
      payload: payload,
    );
  }
  factory RequestStatus.error() {
    return RequestStatus<T>(
      status: Status.Error,
    );
  }
}

extension RequestStatusExt on RequestStatus {
  T when<T>({
    required T Function() onError,
    required T Function(T) onSuccess,
    required T Function() onLoading,
  }) {
    if (status == Status.Error) {
      return onError();
    } else if (status == Status.Loading) {
      return onLoading();
    }
    return onSuccess(payload as T);
  }
}
