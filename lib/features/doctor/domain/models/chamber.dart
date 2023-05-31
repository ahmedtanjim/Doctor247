import 'package:cloud_firestore/cloud_firestore.dart';

class Chamber {
  final String? id;
  final String? name;
  final String? location;
  final String? room;
  final String? time;
  final String? timeOff;
  final String? phone;
  final String? picture;

  Chamber({
    this.id,
    this.name,
    this.location,
    this.room,
    this.time,
    this.timeOff,
    this.phone,
    this.picture,
  });

  factory Chamber.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    Map<String, dynamic>? data = snapshot.data();
    return Chamber(
      id: data?['id'] ?? '',
      name: data?['name'] ?? '',
      location: data?['location'] ?? '',
      room: data?['room'] ?? '',
      time: data?['time'] ?? '',
      timeOff: data?['timeOff'] ?? '',
      phone: data?['phone'] ?? '',
      picture: data?['picture'] ?? '',
    );
  }

  Map<String, dynamic> toFireStore() {
    return {
      if (name != null) 'name': name,
      if (location != null) 'location': location,
      if (room != null) 'room': room,
      if (time != null) 'time': time,
      if (timeOff != null) 'timeOff': timeOff,
      if (phone != null) 'phone': phone,
      if (picture != null) 'picture': picture,
    };
  }
}
