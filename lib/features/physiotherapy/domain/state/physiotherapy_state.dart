import 'package:doctor_247/common/utils/i_view.dart';
import 'package:doctor_247/common/utils/view_state.dart';
import 'package:doctor_247/features/hearing_center/domain/models/hearing_center.dart';
import 'package:doctor_247/features/physiotherapy/domain/models/physiotherapy.dart';

class PhysiotherapyState implements IView {
  @override
  final ViewState viewState;
  final List<Physiotherapy> physiotherapyCenters;

  PhysiotherapyState(this.viewState, this.physiotherapyCenters);

  PhysiotherapyState copyWith({
    ViewState? viewState,
    List<Physiotherapy>? physiotherapyCenters,
  }) {
    return PhysiotherapyState(
      viewState ?? this.viewState,
      physiotherapyCenters ?? this.physiotherapyCenters,
    );
  }
}
