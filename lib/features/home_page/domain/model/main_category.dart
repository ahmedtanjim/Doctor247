import 'package:cloud_firestore/cloud_firestore.dart';

class MainCategory {
  final String name;
  final String initial;
  final String picture;

  const MainCategory(
    this.name,
    this.initial,
    this.picture,
  );

  factory MainCategory.fromDocument(DocumentSnapshot document) {
    return MainCategory(
        document['name'], document['initial'], document['picture']);
  }
}
