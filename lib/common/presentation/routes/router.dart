import 'package:auto_route/auto_route.dart';
import 'package:doctor_247/common/presentation/routes/router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();
  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      page: HomeRoute.page,
      path: '/home',
      initial: true
    ),
    AutoRoute(page: DoctorCategoryRoute.page, path: '/doctors_category'),
    AutoRoute(page: DoctorsListRoute.page, path: '/doctors_list'),
    AutoRoute(page: DoctorsRoute.page, path: '/doctors_page'),
    AutoRoute(page: HearingCenterRoute.page, path: '/hearing_center'),
    AutoRoute(page: HospitalsRoute.page, path: '/hospitals'),
    AutoRoute(page: BloodRoute.page, path: '/blood'),
    AutoRoute(page: BloodBankRoute.page, path: '/blood_bank'),
    AutoRoute(page: PhysiotherapyRoute.page, path: '/physiotherapy'),
    AutoRoute(page: AmbulanceRoute.page, path: '/ambulance'),
    AutoRoute(page: DiagnosticsRoute.page, path: '/diagnostics'),
    AutoRoute(page: AddServiceRoute.page, path: '/addService'),
  ];
}