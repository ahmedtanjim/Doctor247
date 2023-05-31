import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_247/common/utils/Constants.dart';
import 'package:doctor_247/features/ambulance/domain/models/ambulance.dart';
import 'package:doctor_247/features/ambulance/domain/repository/ambulance_repository.dart';
import 'package:flutter/material.dart';

class AmbulanceRepositoryImpl implements AmbulanceRepository {
  final db = FirebaseFirestore.instance;

  @override
  Future<List<Ambulance>?> getAmbulances() async {
    try {
      List<Ambulance> ambulances = [];
      final ref = db
          .collection(Constants.ambulancesCollection)
          .withConverter(
            fromFirestore: Ambulance.fromFirestore,
            toFirestore: (Ambulance ambulance, _) => ambulance.toFireStore(),
          );
      final docSnap = await ref.get();
      for(var item in docSnap.docs){
        ambulances.add(item.data());
      }
      return ambulances;
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}
