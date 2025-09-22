class Profile {
  final String id;
  final String name;
  final String email;
  final String avatar;

  Profile({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
  });
}


 // The UI Widget
// import 'package:flutter/material.dart';

// class MyWidget extends StatelessWidget {
//   const MyWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // Your UI implementation here
//     return Container();
//   }
// }

// // The Data Model
// // Note: This assumes you have a 'Profile' class defined in your domain layer.
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

//   // Convert to Map (for Sqflite)
//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'name': name,
//       'email': email,
//       'avatar': avatar,
//     };
//   }
// }