import 'package:doctor_247/features/ambulance/domain/models/ambulance.dart';
import 'package:doctor_247/features/hearing_center/domain/models/hearing_center.dart';
import 'package:doctor_247/features/physiotherapy/domain/models/physiotherapy.dart';

abstract class AmbulanceRepository {
  Future<List<Ambulance>?> getAmbulances();
}