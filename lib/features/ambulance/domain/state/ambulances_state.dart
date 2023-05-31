import 'package:doctor_247/common/utils/i_view.dart';
import 'package:doctor_247/common/utils/view_state.dart';
import 'package:doctor_247/features/ambulance/domain/models/ambulance.dart';
import 'package:doctor_247/features/hearing_center/domain/models/hearing_center.dart';
import 'package:doctor_247/features/physiotherapy/domain/models/physiotherapy.dart';

class AmbulancesState implements IView {
  @override
  final ViewState viewState;
  final List<Ambulance> ambulances;

  AmbulancesState(this.viewState, this.ambulances);

  AmbulancesState copyWith({
    ViewState? viewState,
    List<Ambulance>? ambulances,
  }) {
    return AmbulancesState(
      viewState ?? this.viewState,
      ambulances ?? this.ambulances,
    );
  }
}
