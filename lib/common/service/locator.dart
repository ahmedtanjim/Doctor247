import 'package:doctor_247/common/presentation/routes/router.dart';
import 'package:doctor_247/features/doctor/data/repository/doctors_repository_impl.dart';
import 'package:doctor_247/features/doctor/domain/repository/doctors_repository.dart';
import 'package:doctor_247/features/doctors_list/data/repository/doctors_list_repository_impl.dart';
import 'package:doctor_247/features/doctors_list/domain/repository/doctors_list_repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerSingleton<AppRouter>(AppRouter());

  getIt.registerSingleton<DoctorsListRepository>(DoctorsListRepositoryImpl());
  getIt.registerSingleton<DoctorsRepository>(DoctorsRepositoryImpl());
}
