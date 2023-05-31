import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_247/common/utils/Constants.dart';
import 'package:doctor_247/common/domain/models/doctor.dart';
import 'package:doctor_247/features/doctors_list/domain/repository/doctors_list_repository.dart';
import 'package:flutter/material.dart';

class DoctorsListRepositoryImpl implements DoctorsListRepository {
  final db = FirebaseFirestore.instance;

  @override
  Future<List<Doctor>?> getDoctors({required String category}) async {
    try {
      List<Doctor> doctors = [];
      final ref = db
          .collection(Constants.doctorsCollection)
          .where('category', isEqualTo: category)
          .withConverter(
            fromFirestore: Doctor.fromFirestore,
            toFirestore: (Doctor doctor, _) => doctor.toFireStore(),
          );
      final docSnap = await ref.get();
      for(var doc in docSnap.docs){
        doctors.add(doc.data());
      }
      return doctors;
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}
