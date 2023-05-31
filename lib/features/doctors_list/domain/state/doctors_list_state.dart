import 'package:doctor_247/common/utils/i_view.dart';
import 'package:doctor_247/common/utils/view_state.dart';
import 'package:doctor_247/common/domain/models/doctor.dart';

class DoctorsListState implements IView {
  @override
  final ViewState viewState;
  final List<Doctor> doctors;
  final String doctorsFieldHeader;
  final String doctorsField;

  DoctorsListState(
      this.viewState, this.doctors, this.doctorsFieldHeader, this.doctorsField);

  DoctorsListState copyWith({
    ViewState? viewState,
    List<Doctor>? doctors,
    String? doctorsFieldHeader,
    String? doctorsField,
  }) {
    return DoctorsListState(
      viewState ?? this.viewState,
      doctors ?? this.doctors,
      doctorsFieldHeader ?? this.doctorsFieldHeader,
      doctorsField ?? this.doctorsField,
    );
  }
}
