import 'package:doctor_247/common/utils/view_state.dart';
import 'package:doctor_247/features/ambulance/data/repository/ambulance_repository_impl.dart';
import 'package:doctor_247/features/ambulance/domain/models/ambulance.dart';
import 'package:doctor_247/features/ambulance/domain/state/ambulances_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final ambulancesControllerProvider =
    StateNotifierProvider.autoDispose<AmbulanceController, AmbulancesState>(
  (ref) => AmbulanceController(
    AmbulancesState(
      ViewState(status: ViewStatus.loading),
      [],
    ),
  ),
);

class AmbulanceController extends StateNotifier<AmbulancesState> {
  AmbulanceController(super.state);

  final ambulancesRepository = AmbulanceRepositoryImpl();

  startLoading() {
    state = state.copyWith(viewState: ViewState(status: ViewStatus.loading));
  }

  stopLoading() {
    state = state.copyWith(viewState: ViewState(status: ViewStatus.dismiss));
  }

  addAmbulances(List<Ambulance> ambulances) {
    state = state.copyWith(ambulances: ambulances);
  }

  error(String error) {
    state = state.copyWith(
        viewState: ViewState(status: ViewStatus.error, error: error));
  }

  Future<void> getAmbulances() async {
    startLoading();
    try {
      final result = await ambulancesRepository.getAmbulances();
      if (result == null) {
        print('its null');
        stopLoading();
      } else {
        addAmbulances(result);
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
