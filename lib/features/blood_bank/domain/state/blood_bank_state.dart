import 'package:doctor_247/common/utils/i_view.dart';
import 'package:doctor_247/common/utils/view_state.dart';
import 'package:doctor_247/features/blood_bank/domain/models/blood_bank.dart';
import 'package:doctor_247/features/hearing_center/domain/models/hearing_center.dart';

class BloodBankState implements IView {
  @override
  final ViewState viewState;
  final List<BloodBank> bloodBanks;

  BloodBankState(this.viewState, this.bloodBanks);

  BloodBankState copyWith({
    ViewState? viewState,
    List<BloodBank>? bloodBanks,
  }) {
    return BloodBankState(
      viewState ?? this.viewState,
      bloodBanks ?? this.bloodBanks,
    );
  }
}
