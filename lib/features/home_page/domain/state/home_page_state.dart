import 'package:doctor_247/common/utils/i_view.dart';
import 'package:doctor_247/common/utils/view_state.dart';
import 'package:doctor_247/features/home_page/domain/model/config.dart';

class HomePageState implements IView {
  @override
  final ViewState viewState;
  final Config config;

  HomePageState(this.viewState, this.config);

  HomePageState copyWith({ViewState? viewState, Config? config}) {
    return HomePageState(viewState ?? this.viewState, config ?? this.config);
  }
}
