import 'package:doctor_247/common/utils/view_state.dart';
import 'package:doctor_247/features/hearing_center/data/repository/hearing_center_repository_impl.dart';
import 'package:doctor_247/features/hearing_center/domain/models/hearing_center.dart';
import 'package:doctor_247/features/hearing_center/domain/state/hearing_centers_state.dart';
import 'package:doctor_247/features/hospital/data/repository/hospital_repository_impl.dart';
import 'package:doctor_247/features/hospital/domain/models/hospital.dart';
import 'package:doctor_247/features/hospital/domain/state/hospitals_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final hospitalsControllerProvider =
    StateNotifierProvider.autoDispose<HospitalsController, HospitalsState>(
  (ref) => HospitalsController(
    HospitalsState(ViewState(status: ViewStatus.loading), [],),
  ),
);

class HospitalsController extends StateNotifier<HospitalsState> {
  HospitalsController(super.state);

  final hearingCentersRepository = HospitalRepositoryImpl();

  startLoading() {
    state = state.copyWith(viewState: ViewState(status: ViewStatus.loading));
  }

  stopLoading() {
    state = state.copyWith(viewState: ViewState(status: ViewStatus.dismiss));
  }

  addHearingCenters(List<Hospital> hospitals) {
    state = state.copyWith(hospitals: hospitals);
  }

  error(String error) {
    state = state.copyWith(
        viewState: ViewState(status: ViewStatus.error, error: error));
  }

  Future<void> getHospitals() async {
    startLoading();
    try {
      final result = await hearingCentersRepository.getHospitals();
      if (result == null) {
        print('its null');
        stopLoading();
      } else {
        addHearingCenters(result);
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
