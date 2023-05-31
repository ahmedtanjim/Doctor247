import 'package:doctor_247/common/utils/view_state.dart';
import 'package:doctor_247/common/domain/models/doctor.dart';
import 'package:doctor_247/features/doctor/data/repository/doctors_repository_impl.dart';
import 'package:doctor_247/features/doctor/domain/models/chamber.dart';
import 'package:doctor_247/features/doctor/domain/state/doctors_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final doctorsControllerProvider =
    StateNotifierProvider.autoDispose<DoctorsController, DoctorsState>(
  (ref) => DoctorsController(
    DoctorsState(
      ViewState(status: ViewStatus.loading),
      Doctor(),
      []
    ),
  ),
);

class DoctorsController extends StateNotifier<DoctorsState> {
  DoctorsController(super.state);

  final doctorsRepository = DoctorsRepositoryImpl();

  startLoading() {
    state = state.copyWith(viewState: ViewState(status: ViewStatus.loading));
  }

  stopLoading() {
    state = state.copyWith(viewState: ViewState(status: ViewStatus.dismiss));
  }

  error(String error) {
    state = state.copyWith(
        viewState: ViewState(status: ViewStatus.error, error: error));
  }

  addDoctor(Doctor doctor) {
    state = state.copyWith(doctor: doctor);
  }

  addChambers(List<Chamber> chambers){
    state = state.copyWith(chambers: chambers);
  }

  Future<void> getDoctor({required String id}) async {
    startLoading();
    try {
      final result = await doctorsRepository.getDoctor(id: id);
      if (result == null) {
        stopLoading();
        print('Its null');
      } else {
        addDoctor(result);
        await getDoctorsChamber(doctorsID: id);
        stopLoading();
        state =
            state.copyWith(viewState: ViewState(status: ViewStatus.success));
      }
    } catch (e) {
      error(e.toString());
      stopLoading();
    }
  }


  Future<void> getDoctorsChamber({required String doctorsID}) async {
    startLoading();
    try {
      final result = await doctorsRepository.getDoctorsChamber(doctorsID: doctorsID);
      if (result == null) {
        stopLoading();
        print('Its null');
      } else {
        print(result);
        print('its ok');
        addChambers(result);
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
