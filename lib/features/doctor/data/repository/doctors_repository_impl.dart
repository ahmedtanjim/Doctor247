import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_247/common/utils/Constants.dart';
import 'package:doctor_247/common/domain/models/doctor.dart';
import 'package:doctor_247/features/doctor/domain/models/chamber.dart';
import 'package:doctor_247/features/doctor/domain/repository/doctors_repository.dart';
import 'package:flutter/material.dart';

class DoctorsRepositoryImpl implements DoctorsRepository {
  final db = FirebaseFirestore.instance;

  @override
  Future<Doctor?> getDoctor({required String id}) async {
    try {
      print(id);
      final ref = db
          .collection(Constants.doctorsCollection)
          .doc(id.toString())
          .withConverter(
            fromFirestore: Doctor.fromFirestore,
            toFirestore: (Doctor doctor, _) => doctor.toFireStore(),
          );
      final docSnap = await ref.get();
      return docSnap.data();
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  @override
  Future<List<Chamber>?> getDoctorsChamber({required String doctorsID}) async {
    try {
      List<Chamber> chambers = [];
      final ref = db
          .collection(Constants.doctorsCollection)
          .doc(doctorsID)
          .collection(Constants.doctorsChamberCollection)
          .withConverter(
            fromFirestore: Chamber.fromFirestore,
            toFirestore: (Chamber chamber, _) => chamber.toFireStore(),
          );
      final docSnap = await ref.get();
      for (var doc in docSnap.docs) {
        chambers.add(doc.data());
        print(doc.data());
      }
      return chambers;
    } catch (e) {
      print('sppry');
      debugPrint(e.toString());
    }
    return null;
  }
}
