import 'package:doctor_247/features/blood_bank/domain/models/blood_bank.dart';

abstract class BloodBankRepository {
  Future<List<BloodBank>?> getBloodBanks();
}