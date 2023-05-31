import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_247/common/utils/Constants.dart';
import 'package:doctor_247/features/hearing_center/domain/models/hearing_center.dart';
import 'package:doctor_247/features/hearing_center/domain/repository/hearing_center_repository.dart';
import 'package:flutter/material.dart';

class HearingCenterRepositoryImpl implements HearingCenterRepository {
  final db = FirebaseFirestore.instance;

  @override
  Future<List<HearingCenter>?> getHearingCenters() async {
    try {
      List<HearingCenter> hearingCenters = [];
      final ref = db
          .collection(Constants.hearingCentersCollection)
          .withConverter(
            fromFirestore: HearingCenter.fromFirestore,
            toFirestore: (HearingCenter hearingCenter, _) => hearingCenter.toFireStore(),
          );
      final docSnap = await ref.get();
      for(var item in docSnap.docs){
        hearingCenters.add(item.data());
      }
      return hearingCenters;
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}
