import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_247/common/utils/Constants.dart';
import 'package:doctor_247/features/hearing_center/domain/models/hearing_center.dart';
import 'package:doctor_247/features/hospital/domain/models/hospital.dart';
import 'package:doctor_247/features/hospital/domain/repository/hospital_repository.dart';
import 'package:flutter/material.dart';

class HospitalRepositoryImpl implements HospitalRepository {
  final db = FirebaseFirestore.instance;

  @override
  Future<List<Hospital>?> getHospitals() async {
    try {
      List<Hospital> hospitals = [];
      final ref = db
          .collection(Constants.hospitalsCollection)
          .withConverter(
            fromFirestore: Hospital.fromFirestore,
            toFirestore: (Hospital hospital, _) => hospital.toFireStore(),
          );
      final docSnap = await ref.get();
      for(var item in docSnap.docs){
        hospitals.add(item.data());
      }
      return hospitals;
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}
