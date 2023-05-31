import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_247/common/utils/Constants.dart';
import 'package:doctor_247/features/blood_bank/domain/models/blood_bank.dart';
import 'package:doctor_247/features/blood_bank/domain/repository/blood_bank_repository.dart';
import 'package:flutter/foundation.dart';

class BloodBankRepositoryImpl extends BloodBankRepository {

  @override
  Future<List<BloodBank>?> getBloodBanks() async {
    final db = FirebaseFirestore.instance;


    try {
      List<BloodBank> bloodBank = [];
      final ref = db
          .collection(Constants.bloodBankCollection)
          .withConverter(
        fromFirestore: BloodBank.fromFirestore,
        toFirestore: (BloodBank bloodBank, _) => bloodBank.toFireStore(),
      );
      final docSnap = await ref.get();
      for(var item in docSnap.docs){
        bloodBank.add(item.data());
      }
      return bloodBank;
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

}