import 'package:doctor_247/features/home_page/domain/model/config.dart';

abstract class HomePageRepository{
  Future<Config?> getConfig();
}