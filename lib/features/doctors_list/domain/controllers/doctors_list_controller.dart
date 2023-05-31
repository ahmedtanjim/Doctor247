import 'package:doctor_247/common/service/locator.dart';
import 'package:doctor_247/common/utils/view_state.dart';
import 'package:doctor_247/common/domain/models/doctor.dart';
import 'package:doctor_247/features/doctors_list/data/repository/doctors_list_repository_impl.dart';
import 'package:doctor_247/features/doctors_list/domain/repository/doctors_list_repository.dart';
import 'package:doctor_247/features/doctors_list/domain/state/doctors_list_state.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final doctorsListControllerProvider =
    StateNotifierProvider.autoDispose<DoctorsListController, DoctorsListState>(
  (ref) => DoctorsListController(
    DoctorsListState(ViewState(status: ViewStatus.loading), [], 'medicine', ''),
  ),
);

class DoctorsListController extends StateNotifier<DoctorsListState> {
  DoctorsListController(super.state);

  final doctorsRepository = DoctorsListRepositoryImpl();

  startLoading() {
    state = state.copyWith(viewState: ViewState(status: ViewStatus.loading));
  }

  stopLoading() {
    state = state.copyWith(viewState: ViewState(status: ViewStatus.dismiss));
  }

  addDoctors(List<Doctor> doctors) {
    state = state.copyWith(doctors: doctors);
  }

  setDoctorsField(String doctorsField, String doctorsFieldHeader) {
    state = state.copyWith(
        doctorsField: doctorsField, doctorsFieldHeader: doctorsFieldHeader);
  }

  error(String error) {
    state = state.copyWith(
        viewState: ViewState(status: ViewStatus.error, error: error));
  }

  Future<void> getDoctors({required String category}) async {
    startLoading();
    try {
      final result = await doctorsRepository.getDoctors(category: category);
      debugPrint('${result?.first.degree} helloQ');
      if (result == null) {
        print('its null');
        stopLoading();
      } else {
        addDoctors(result);
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
