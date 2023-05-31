import 'package:doctor_247/common/utils/i_view.dart';
import 'package:doctor_247/common/utils/view_state.dart';
import 'package:doctor_247/features/hearing_center/domain/models/hearing_center.dart';
import 'package:doctor_247/features/hospital/domain/models/hospital.dart';

class HospitalsState implements IView {
  @override
  final ViewState viewState;
  final List<Hospital> hospitals;

  HospitalsState(this.viewState, this.hospitals);

  HospitalsState copyWith({
    ViewState? viewState,
    List<Hospital>? hospitals,
  }) {
    return HospitalsState(
      viewState ?? this.viewState,
      hospitals ?? this.hospitals,
    );
  }
}