import 'package:doctor_247/common/utils/view_state.dart';
import 'package:doctor_247/features/hearing_center/data/repository/hearing_center_repository_impl.dart';
import 'package:doctor_247/features/hearing_center/domain/models/hearing_center.dart';
import 'package:doctor_247/features/hearing_center/domain/state/hearing_centers_state.dart';
import 'package:doctor_247/features/physiotherapy/data/repository/physiotherapy_repository_impl.dart';
import 'package:doctor_247/features/physiotherapy/domain/models/physiotherapy.dart';
import 'package:doctor_247/features/physiotherapy/domain/state/physiotherapy_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final physiotherapyControllerProvider =
    StateNotifierProvider.autoDispose<PhysiotherapyController, PhysiotherapyState>(
  (ref) => PhysiotherapyController(
    PhysiotherapyState(ViewState(status: ViewStatus.loading), [],),
  ),
);

class PhysiotherapyController extends StateNotifier<PhysiotherapyState> {
  PhysiotherapyController(super.state);

  final physiotherapyRepository = PhysioTherapyRepositoryImpl();

  startLoading() {
    state = state.copyWith(viewState: ViewState(status: ViewStatus.loading));
  }

  stopLoading() {
    state = state.copyWith(viewState: ViewState(status: ViewStatus.dismiss));
  }

  addPhysiotherapyCenters(List<Physiotherapy> physiotherapyCenters) {
    state = state.copyWith(physiotherapyCenters: physiotherapyCenters);
  }

  error(String error) {
    state = state.copyWith(
        viewState: ViewState(status: ViewStatus.error, error: error));
  }

  Future<void> getPhysiotherapyCenters() async {
    startLoading();
    try {
      final result = await physiotherapyRepository.getPhysioTherapyCenters();
      if (result == null) {
        print('its null');
        stopLoading();
      } else {
        addPhysiotherapyCenters(result);
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
