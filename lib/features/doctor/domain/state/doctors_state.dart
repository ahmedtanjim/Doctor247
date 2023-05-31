import 'package:doctor_247/common/utils/i_view.dart';
import 'package:doctor_247/common/utils/view_state.dart';
import 'package:doctor_247/common/domain/models/doctor.dart';
import 'package:doctor_247/features/doctor/domain/models/chamber.dart';

class DoctorsState implements IView {
  @override
  final ViewState viewState;
  final Doctor doctor;
  final List<Chamber> chambers;

  DoctorsState(
      this.viewState, this.doctor, this.chambers);

  DoctorsState copyWith({
    ViewState? viewState,
    Doctor? doctor,
    List<Chamber>? chambers
  }) {
    return DoctorsState(
      viewState ?? this.viewState,
      doctor ?? this.doctor,
      chambers ?? this.chambers
    );
  }
}
