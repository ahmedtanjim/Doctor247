import 'package:doctor_247/features/hearing_center/domain/models/hearing_center.dart';

abstract class HearingCenterRepository {
  Future<List<HearingCenter>?> getHearingCenters();
}