import 'package:doctor_247/common/domain/models/doctor.dart';

abstract class DoctorsListRepository {
  Future<List<Doctor>?> getDoctors({required String category});
}