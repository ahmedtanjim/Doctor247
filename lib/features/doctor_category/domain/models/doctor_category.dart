import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorCategory {
  final String name;
  final String initial;
  final String picture;

  const DoctorCategory(
      this.name,
      this.initial,
      this.picture,
      );

  factory DoctorCategory.fromDocument(DocumentSnapshot document) {
    return DoctorCategory(
        document['name'], document['initial'], document['picture']);
  }
}
