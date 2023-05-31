import 'package:doctor_247/common/utils/view_state.dart';
import 'package:doctor_247/features/home_page/data/repository/home_page_repository_impl.dart';
import 'package:doctor_247/features/home_page/domain/model/config.dart';
import 'package:doctor_247/features/home_page/domain/state/home_page_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homePageControllerProvider =
StateNotifierProvider.autoDispose<HomePageController, HomePageState>(
      (ref) => HomePageController(
    HomePageState(ViewState(status: ViewStatus.loading), Config(bannerImages: [], notice: '')),
  ),
);

class HomePageController extends StateNotifier<HomePageState> {
  HomePageController(super.state);

  final homePageRepository = HomePageRepositoryImpl();

  startLoading() {
    state = state.copyWith(viewState: ViewState(status: ViewStatus.loading));
  }

  stopLoading() {
    state = state.copyWith(viewState: ViewState(status: ViewStatus.dismiss));
  }

  addConfig(Config config) {
    state = state.copyWith(config: config);
  }

  error(String error) {
    state = state.copyWith(
        viewState: ViewState(status: ViewStatus.error, error: error));
  }


  Future<void> getConfig() async {
    startLoading();
    try {
      final result = await homePageRepository.getConfig();
      if (result == null) {
        debugPrint('home page config is null');
        stopLoading();
      } else {
        addConfig(result);
        stopLoading();
        state = state.copyWith(viewState: ViewState(status: ViewStatus.success));
      }
    }catch(e){
      error(e.toString());
      stopLoading();
    }
  }

}