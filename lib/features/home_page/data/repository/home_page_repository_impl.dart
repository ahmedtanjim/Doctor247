import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_247/common/utils/Constants.dart';
import 'package:doctor_247/features/home_page/domain/model/config.dart';
import 'package:doctor_247/features/home_page/domain/repository/home_page_repository.dart';
import 'package:flutter/cupertino.dart';

class HomePageRepositoryImpl extends HomePageRepository {
  final db = FirebaseFirestore.instance;

  @override
  Future<Config?> getConfig() async {
    try {
      final ref = db
          .collection(Constants.configCollection)
          .doc('home_page')
          .withConverter(
          fromFirestore: Config.fromFirestore,
          toFirestore: (Config config, _) => config.toFireStore());
      final docSnap = await ref.get();
      return docSnap.data();
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}
