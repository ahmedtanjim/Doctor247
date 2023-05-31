import 'package:cloud_firestore/cloud_firestore.dart';

class Ambulance {
  final String? id;
  final String? name;
  final String? phone;
  final String? location;
  final String? picture;

  Ambulance({
    this.id,
    this.name,
    this.phone,
    this.location,
    this.picture,
  });

  factory Ambulance.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    Map<String, dynamic>? data = snapshot.data();
    return Ambulance(
      id: data?['id'] ?? '',
      name: data?['name'] ?? '',
      phone: data?['phone'] ?? '',
      location: data?['location'] ?? '',
      picture: data?['picture'] ?? '',
    );
  }

  Map<String, dynamic> toFireStore() {
    return {
      if (name != null) 'name': name,
      if (phone != null) 'phone': phone,
      if (location != null) 'location': location,
      if (picture != null) 'picture': picture,
    };
  }
}
