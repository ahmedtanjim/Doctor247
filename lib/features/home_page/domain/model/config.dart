import 'package:cloud_firestore/cloud_firestore.dart';

class Config {
  final String? notice;
  final List<String>? bannerImages;

  Config({this.notice, this.bannerImages});

  factory Config.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    Map<String, dynamic>? data = snapshot.data();
    return Config(
      notice: data?['notice'] ?? '',
      bannerImages: List<String>.from(data?['bannerImages']),
    );
  }

  Map<String, dynamic> toFireStore() {
    return {
      if (notice != null) 'notice': notice,
      if (bannerImages != null) 'bannerImages': bannerImages,
    };
  }
}
