// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:doctor_247/features/add_service/presentation/add_service_page.dart'
    as _i12;
import 'package:doctor_247/features/ambulance/presentation/ambulance_page.dart'
    as _i10;
import 'package:doctor_247/features/blood/presentation/blood_page.dart' as _i7;
import 'package:doctor_247/features/blood_bank/presentation/blood_bank_page.dart'
    as _i8;
import 'package:doctor_247/features/diagnostic/presentation/diagnostics_page.dart'
    as _i11;
import 'package:doctor_247/features/doctor/presentation/doctors_page.dart'
    as _i4;
import 'package:doctor_247/features/doctor_category/presentation/doctor_category_page.dart'
    as _i5;
import 'package:doctor_247/features/doctors_list/presentation/doctors_list_page.dart'
    as _i1;
import 'package:doctor_247/features/hearing_center/presentation/hearing_center_page.dart'
    as _i3;
import 'package:doctor_247/features/home_page/presentation/home_page.dart'
    as _i2;
import 'package:doctor_247/features/hospital/presentation/hospital_page.dart'
    as _i6;
import 'package:doctor_247/features/physiotherapy/presentation/physiotherapy_page.dart'
    as _i9;
import 'package:flutter/material.dart' as _i14;

abstract class $AppRouter extends _i13.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    DoctorsListRoute.name: (routeData) {
      final args = routeData.argsAs<DoctorsListRouteArgs>();
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.DoctorsListPage(
          args.index,
          key: args.key,
          doctorsField: args.doctorsField,
          doctorsFieldHeader: args.doctorsFieldHeader,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomePage(),
      );
    },
    HearingCenterRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HearingCenterPage(),
      );
    },
    DoctorsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<DoctorsRouteArgs>(
          orElse: () =>
              DoctorsRouteArgs(doctorID: pathParams.getString('doctorID')));
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.DoctorsPage(
          key: args.key,
          doctorID: args.doctorID,
        ),
      );
    },
    DoctorCategoryRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.DoctorCategoryPage(),
      );
    },
    HospitalsRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.HospitalsPage(),
      );
    },
    BloodRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.BloodPage(),
      );
    },
    BloodBankRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.BloodBankPage(),
      );
    },
    PhysiotherapyRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.PhysiotherapyPage(),
      );
    },
    AmbulanceRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.AmbulancePage(),
      );
    },
    DiagnosticsRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.DiagnosticsPage(),
      );
    },
    AddServiceRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.AddServicePage(),
      );
    },
  };
}

/// generated route for
/// [_i1.DoctorsListPage]
class DoctorsListRoute extends _i13.PageRouteInfo<DoctorsListRouteArgs> {
  DoctorsListRoute({
    required int index,
    _i14.Key? key,
    required String doctorsField,
    required String doctorsFieldHeader,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          DoctorsListRoute.name,
          args: DoctorsListRouteArgs(
            index: index,
            key: key,
            doctorsField: doctorsField,
            doctorsFieldHeader: doctorsFieldHeader,
          ),
          rawPathParams: {
            'doctorsField': doctorsField,
            'doctorsFieldHeader': doctorsFieldHeader,
          },
          initialChildren: children,
        );

  static const String name = 'DoctorsListRoute';

  static const _i13.PageInfo<DoctorsListRouteArgs> page =
      _i13.PageInfo<DoctorsListRouteArgs>(name);
}

class DoctorsListRouteArgs {
  const DoctorsListRouteArgs({
    required this.index,
    this.key,
    required this.doctorsField,
    required this.doctorsFieldHeader,
  });

  final int index;

  final _i14.Key? key;

  final String doctorsField;

  final String doctorsFieldHeader;

  @override
  String toString() {
    return 'DoctorsListRouteArgs{index: $index, key: $key, doctorsField: $doctorsField, doctorsFieldHeader: $doctorsFieldHeader}';
  }
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i13.PageRouteInfo<void> {
  const HomeRoute({List<_i13.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HearingCenterPage]
class HearingCenterRoute extends _i13.PageRouteInfo<void> {
  const HearingCenterRoute({List<_i13.PageRouteInfo>? children})
      : super(
          HearingCenterRoute.name,
          initialChildren: children,
        );

  static const String name = 'HearingCenterRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i4.DoctorsPage]
class DoctorsRoute extends _i13.PageRouteInfo<DoctorsRouteArgs> {
  DoctorsRoute({
    _i14.Key? key,
    required String doctorID,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          DoctorsRoute.name,
          args: DoctorsRouteArgs(
            key: key,
            doctorID: doctorID,
          ),
          rawPathParams: {'doctorID': doctorID},
          initialChildren: children,
        );

  static const String name = 'DoctorsRoute';

  static const _i13.PageInfo<DoctorsRouteArgs> page =
      _i13.PageInfo<DoctorsRouteArgs>(name);
}

class DoctorsRouteArgs {
  const DoctorsRouteArgs({
    this.key,
    required this.doctorID,
  });

  final _i14.Key? key;

  final String doctorID;

  @override
  String toString() {
    return 'DoctorsRouteArgs{key: $key, doctorID: $doctorID}';
  }
}

/// generated route for
/// [_i5.DoctorCategoryPage]
class DoctorCategoryRoute extends _i13.PageRouteInfo<void> {
  const DoctorCategoryRoute({List<_i13.PageRouteInfo>? children})
      : super(
          DoctorCategoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'DoctorCategoryRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i6.HospitalsPage]
class HospitalsRoute extends _i13.PageRouteInfo<void> {
  const HospitalsRoute({List<_i13.PageRouteInfo>? children})
      : super(
          HospitalsRoute.name,
          initialChildren: children,
        );

  static const String name = 'HospitalsRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i7.BloodPage]
class BloodRoute extends _i13.PageRouteInfo<void> {
  const BloodRoute({List<_i13.PageRouteInfo>? children})
      : super(
          BloodRoute.name,
          initialChildren: children,
        );

  static const String name = 'BloodRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i8.BloodBankPage]
class BloodBankRoute extends _i13.PageRouteInfo<void> {
  const BloodBankRoute({List<_i13.PageRouteInfo>? children})
      : super(
          BloodBankRoute.name,
          initialChildren: children,
        );

  static const String name = 'BloodBankRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i9.PhysiotherapyPage]
class PhysiotherapyRoute extends _i13.PageRouteInfo<void> {
  const PhysiotherapyRoute({List<_i13.PageRouteInfo>? children})
      : super(
          PhysiotherapyRoute.name,
          initialChildren: children,
        );

  static const String name = 'PhysiotherapyRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i10.AmbulancePage]
class AmbulanceRoute extends _i13.PageRouteInfo<void> {
  const AmbulanceRoute({List<_i13.PageRouteInfo>? children})
      : super(
          AmbulanceRoute.name,
          initialChildren: children,
        );

  static const String name = 'AmbulanceRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i11.DiagnosticsPage]
class DiagnosticsRoute extends _i13.PageRouteInfo<void> {
  const DiagnosticsRoute({List<_i13.PageRouteInfo>? children})
      : super(
          DiagnosticsRoute.name,
          initialChildren: children,
        );

  static const String name = 'DiagnosticsRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i12.AddServicePage]
class AddServiceRoute extends _i13.PageRouteInfo<void> {
  const AddServiceRoute({List<_i13.PageRouteInfo>? children})
      : super(
          AddServiceRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddServiceRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}
