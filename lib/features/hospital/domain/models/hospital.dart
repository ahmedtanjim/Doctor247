import 'package:cloud_firestore/cloud_firestore.dart';

class Hospital {
  final String? id;
  final String? name;
  final String? phone;
  final String? location;
  final String? picture;
  final String? discount;

  Hospital({
    this.id,
    this.name,
    this.phone,
    this.location,
    this.picture,
    this.discount,
  });

  factory Hospital.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    Map<String, dynamic>? data = snapshot.data();
    return Hospital(
      id: data?['id'] ?? '',
      name: data?['name'] ?? '',
      phone: data?['phone'] ?? '',
      location: data?['location'] ?? '',
      picture: data?['picture'] ?? '',
      discount: data?['discount'] ?? '',
    );
  }

  Map<String, dynamic> toFireStore() {
    return {
      if (name != null) 'name': name,
      if (phone != null) 'phone': phone,
      if (location != null) 'location': location,
      if (picture != null) 'picture': picture,
      if (discount != null) 'discount': discount,
    };
  }
}
