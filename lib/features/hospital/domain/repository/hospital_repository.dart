import 'package:doctor_247/features/hospital/domain/models/hospital.dart';

abstract class HospitalRepository {
  Future<List<Hospital>?> getHospitals();
}