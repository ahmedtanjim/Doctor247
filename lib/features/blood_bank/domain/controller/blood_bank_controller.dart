import 'package:doctor_247/common/utils/view_state.dart';
import 'package:doctor_247/features/blood_bank/data/repository/blood_bank_repository_impl.dart';
import 'package:doctor_247/features/blood_bank/domain/models/blood_bank.dart';
import 'package:doctor_247/features/blood_bank/domain/state/blood_bank_state.dart';
import 'package:doctor_247/features/hearing_center/data/repository/hearing_center_repository_impl.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final bloodBankControllerProvider =
    StateNotifierProvider.autoDispose<BloodBankController, BloodBankState>(
  (ref) => BloodBankController(
    BloodBankState(ViewState(status: ViewStatus.loading), [],),
  ),
);

class BloodBankController extends StateNotifier<BloodBankState> {
  BloodBankController(super.state);

  final bloodBanksRepository = BloodBankRepositoryImpl();

  startLoading() {
    state = state.copyWith(viewState: ViewState(status: ViewStatus.loading));
  }

  stopLoading() {
    state = state.copyWith(viewState: ViewState(status: ViewStatus.dismiss));
  }

  addBloodBanks(List<BloodBank> bloodBanks) {
    state = state.copyWith(bloodBanks: bloodBanks);
  }

  error(String error) {
    state = state.copyWith(
        viewState: ViewState(status: ViewStatus.error, error: error));
  }

  Future<void> getBloodBanks() async {
    startLoading();
    try {
      final result = await bloodBanksRepository.getBloodBanks();
      if (result == null) {
        print('its null');
        stopLoading();
      } else {
        addBloodBanks(result);
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
