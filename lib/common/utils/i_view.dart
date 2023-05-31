import 'view_state.dart';

// abstract class is what dart calls interfaces
abstract class IView {
  final ViewState viewState = ViewState(status: ViewStatus.loading);
}
