import 'package:doctor_247/common/domain/models/doctor.dart';
import 'package:doctor_247/features/doctor/domain/models/chamber.dart';

abstract class DoctorsRepository {
  Future<Doctor?> getDoctor({required String id});

  Future<List<Chamber>?> getDoctorsChamber({required String doctorsID});
}
