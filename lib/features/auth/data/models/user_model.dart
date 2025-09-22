// import 'package:firebase_auth/firebase_auth.dart' as firebase;
// import '../../domain/entities/user.dart';

// class UserModel extends User {
//   UserModel({
//     required super.id,
//     required super.name,
//     required super.email,
//     super.photoUrl,
//   });

//   factory UserModel.fromFirebaseUser(firebase.User user) {
//     return UserModel(
//       id: user.uid,
//       name: user.displayName ?? '',
//       email: user.email ?? '',
//       photoUrl: user.photoURL,
//     );
//   }
// }


import 'package:firebase_auth/firebase_auth.dart' as firebase;
import '../../domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.name,
    required super.email,
    super.photoUrl,
  });

  factory UserModel.fromFirebaseUser(firebase.User user) {
    return UserModel(
      id: user.uid,
      name: user.displayName ?? '',
      email: user.email ?? '',
      photoUrl: user.photoURL,
    );
  }
}