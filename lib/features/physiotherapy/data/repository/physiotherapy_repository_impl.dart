import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_247/common/utils/Constants.dart';
import 'package:doctor_247/features/hearing_center/domain/models/hearing_center.dart';
import 'package:doctor_247/features/hearing_center/domain/repository/hearing_center_repository.dart';
import 'package:doctor_247/features/physiotherapy/domain/models/physiotherapy.dart';
import 'package:doctor_247/features/physiotherapy/domain/repository/physiotherapy_repository.dart';
import 'package:flutter/material.dart';

class PhysioTherapyRepositoryImpl implements PhysiotherapyRepository {
  final db = FirebaseFirestore.instance;

  @override
  Future<List<Physiotherapy>?> getPhysioTherapyCenters() async {
    try {
      List<Physiotherapy> physiotherapy = [];
      final ref = db
          .collection(Constants.physiotherapyCollection)
          .withConverter(
            fromFirestore: Physiotherapy.fromFirestore,
            toFirestore: (Physiotherapy physiotherapy, _) => physiotherapy.toFireStore(),
          );
      final docSnap = await ref.get();
      for(var item in docSnap.docs){
        physiotherapy.add(item.data());
      }
      return physiotherapy;
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}
