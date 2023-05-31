import 'package:doctor_247/features/hearing_center/domain/models/hearing_center.dart';
import 'package:doctor_247/features/physiotherapy/domain/models/physiotherapy.dart';

abstract class PhysiotherapyRepository {
  Future<List<Physiotherapy>?> getPhysioTherapyCenters();
}