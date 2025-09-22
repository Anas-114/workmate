// import '../../domain/entities/profile.dart';

// class ProfileModel extends Profile {
//   ProfileModel({
//     required String id,
//     required String name,
//     required String email,
//     required String avatar,
//   }) : super(id: id, name: name, email: email, avatar: avatar);

//   // Convert from Map (from Sqflite)
//   factory ProfileModel.fromMap(Map<String, dynamic> map) {
//     return ProfileModel(
//       id: map['id'],
//       name: map['name'],
//       email: map['email'],
//       avatar: map['avatar'],
//     );
//   }
// // Convert to Map (for Sqflite)
//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'name': name,
//       'email': email,
//       'avatar': avatar,
//     };
//   }
// }

import '../../domain/entities/profile.dart';

class ProfileModel extends Profile {
  ProfileModel({
    required String id,
    required String name,
    required String email,
    required String avatar,
  }) : super(id: id, name: name, email: email, avatar: avatar);

  // Convert from Map (from Sqflite)
  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      avatar: map['avatar'],
    );
  }
  
  // Convert to Map (for Sqflite)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'avatar': avatar,
    };
  }
}