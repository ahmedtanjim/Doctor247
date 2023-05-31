import 'package:doctor_247/common/utils/i_view.dart';
import 'package:doctor_247/common/utils/view_state.dart';
import 'package:doctor_247/features/hearing_center/domain/models/hearing_center.dart';

class HearingCentersState implements IView {
  @override
  final ViewState viewState;
  final List<HearingCenter> hearingCenters;

  HearingCentersState(this.viewState, this.hearingCenters);

  HearingCentersState copyWith({
    ViewState? viewState,
    List<HearingCenter>? hearingCenters,
  }) {
    return HearingCentersState(
      viewState ?? this.viewState,
      hearingCenters ?? this.hearingCenters,
    );
  }
}
