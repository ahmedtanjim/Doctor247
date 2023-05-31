import 'package:doctor_247/common/utils/view_state.dart';
import 'package:doctor_247/features/hearing_center/data/repository/hearing_center_repository_impl.dart';
import 'package:doctor_247/features/hearing_center/domain/models/hearing_center.dart';
import 'package:doctor_247/features/hearing_center/domain/state/hearing_centers_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final hearingCentersControllerProvider =
    StateNotifierProvider.autoDispose<HearingCenterController, HearingCentersState>(
  (ref) => HearingCenterController(
    HearingCentersState(ViewState(status: ViewStatus.loading), [],),
  ),
);

class HearingCenterController extends StateNotifier<HearingCentersState> {
  HearingCenterController(super.state);

  final hearingCentersRepository = HearingCenterRepositoryImpl();

  startLoading() {
    state = state.copyWith(viewState: ViewState(status: ViewStatus.loading));
  }

  stopLoading() {
    state = state.copyWith(viewState: ViewState(status: ViewStatus.dismiss));
  }

  addHearingCenters(List<HearingCenter> hearingCenters) {
    state = state.copyWith(hearingCenters: hearingCenters);
  }

  error(String error) {
    state = state.copyWith(
        viewState: ViewState(status: ViewStatus.error, error: error));
  }

  Future<void> getHearingCenter() async {
    startLoading();
    try {
      final result = await hearingCentersRepository.getHearingCenters();
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
