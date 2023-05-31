import 'package:cloud_firestore/cloud_firestore.dart';

class Doctor {
  final String? id;
  final String? name;
  final String? category;
  final String? shortDescOne;
  final String? shortDescTwo;
  final String? degree;
  final String? picture;
  final String? appointmentFee;

  Doctor({
    this.id,
    this.name,
    this.category,
    this.shortDescOne,
    this.shortDescTwo,
    this.degree,
    this.picture,
    this.appointmentFee,
  });

  factory Doctor.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    Map<String, dynamic>? data = snapshot.data();
    return Doctor(
      id: data?['id'] ?? '',
      name: data?['name'] ?? '',
      category: data?['category'] ?? '',
      shortDescOne: data?['shortDescOne'] ?? '',
      shortDescTwo: data?['shortDescTwo'] ?? '',
      degree: data?['degree'] ?? '',
      picture: data?['picture'] ?? '',
      appointmentFee: data?['appointmentFee'] ?? '',
    );
  }

  Map<String, dynamic> toFireStore() {
    return {
      if (name != null) 'name': name,
      if (category != null) 'category': category,
      if (shortDescOne != null) 'shortDescOne': shortDescOne,
      if (shortDescTwo != null) 'shortDescTwo': shortDescTwo,
      if (degree != null) 'degree': degree,
      if (picture != null) 'picture': picture,
      if (appointmentFee != null) 'appointmentFee': appointmentFee,
    };
  }
}
