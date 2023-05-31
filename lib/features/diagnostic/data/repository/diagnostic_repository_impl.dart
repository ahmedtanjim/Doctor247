import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_247/common/utils/Constants.dart';
import 'package:doctor_247/features/diagnostic/domain/models/diagnostic.dart';
import 'package:doctor_247/features/diagnostic/domain/repository/diagnostic_repository.dart';
import 'package:flutter/material.dart';

class DiagnosticRepositoryImpl implements DiagnosticRepository {
  final db = FirebaseFirestore.instance;

  @override
  Future<List<Diagnostic>?> getDiagnostics() async {
    try {
      List<Diagnostic> diagnostic = [];
      final ref = db
          .collection(Constants.diagnosticCollection)
          .withConverter(
            fromFirestore: Diagnostic.fromFirestore,
            toFirestore: (Diagnostic diagnostic, _) => diagnostic.toFireStore(),
          );
      final docSnap = await ref.get();
      for(var item in docSnap.docs){
        diagnostic.add(item.data());
      }
      return diagnostic;
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}
