class ViewState {
  late ViewStatus? status;
  late String? error;

  ViewState({this.status = ViewStatus.loading, this.error}) {
    if (error != null) {
      status = ViewStatus.error;
    }
  }
}

enum ViewStatus { error, loading, success, dismiss }