import 'package:doctor_247/common/utils/i_view.dart';
import 'package:doctor_247/common/utils/view_state.dart';
import 'package:doctor_247/features/diagnostic/domain/models/diagnostic.dart';

class DiagnosticState implements IView {
  @override
  final ViewState viewState;
  final List<Diagnostic> diagnostics;

  DiagnosticState(this.viewState, this.diagnostics);

  DiagnosticState copyWith({
    ViewState? viewState,
    List<Diagnostic>? diagnostics,
  }) {
    return DiagnosticState(
      viewState ?? this.viewState,
      diagnostics ?? this.diagnostics,
    );
  }
}
