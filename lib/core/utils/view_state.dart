enum ViewState {
  idle,
  loading,
  success,
  error
}

extension ViewStateExtension on ViewState {
  bool get isLoading => this == ViewState.loading;
  bool get isError => this == ViewState.error;
  bool get isIdle => this == ViewState.idle;
  bool get isSuccess => this == ViewState.success;
}