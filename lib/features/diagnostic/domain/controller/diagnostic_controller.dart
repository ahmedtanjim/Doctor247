import 'package:doctor_247/common/utils/view_state.dart';
import 'package:doctor_247/features/ambulance/data/repository/ambulance_repository_impl.dart';
import 'package:doctor_247/features/diagnostic/data/repository/diagnostic_repository_impl.dart';
import 'package:doctor_247/features/diagnostic/domain/models/diagnostic.dart';
import 'package:doctor_247/features/diagnostic/domain/state/diagnostic_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final diagnosticControllerProvider =
    StateNotifierProvider.autoDispose<DiagnosticController, DiagnosticState>(
  (ref) => DiagnosticController(
    DiagnosticState(
      ViewState(status: ViewStatus.loading),
      [],
    ),
  ),
);

class DiagnosticController extends StateNotifier<DiagnosticState> {
  DiagnosticController(super.state);

  final diagnosticsRepository = DiagnosticRepositoryImpl();

  startLoading() {
    state = state.copyWith(viewState: ViewState(status: ViewStatus.loading));
  }

  stopLoading() {
    state = state.copyWith(viewState: ViewState(status: ViewStatus.dismiss));
  }

  addDiagnostics(List<Diagnostic> diagnostics) {
    state = state.copyWith(diagnostics: diagnostics);
  }

  error(String error) {
    state = state.copyWith(
        viewState: ViewState(status: ViewStatus.error, error: error));
  }

  Future<void> getDiagnostics() async {
    startLoading();
    try {
      final result = await diagnosticsRepository.getDiagnostics();
      if (result == null) {
        print('its null');
        stopLoading();
      } else {
        addDiagnostics(result);
        stopLoading();
        state =
            state.copyWith(viewState: ViewState(status: ViewStatus.success));
      }
    } catch (e) {
      error(e.toString());
      stopLoading();
    }
  }
}
