// import 'dart:developer';

// import 'package:firebase_auth/firebase_auth.dart' as firebase;
// import 'package:workmate/features/auth/data/datasources/google_auth_service.dart';
// import '../models/user_model.dart';
// import '../../domain/entities/user.dart';
// import '../../domain/repositories/auth_repository.dart';

// class AuthRepositoryImpl implements AuthRepository {
//   final GoogleAuthService _googleAuthService;

//   AuthRepositoryImpl(this._googleAuthService);

//   @override
//   Future<User> signIn({bool checkOnly = false}) async {
//     try {
//       log("AuthRepositoryImpl: signIn called | checkOnly = $checkOnly");

//       if (checkOnly) {
//         final firebase.User? current = _googleAuthService.getCurrentUser();
//         log("AuthRepositoryImpl: current user = $current");

//         if (current != null) {
//           final userModel = UserModel.fromFirebaseUser(current);
//           log("AuthRepositoryImpl: returning user from cache → ${userModel.id}");
//           return userModel;
//         }
//         throw Exception("No user logged in");
//       }

//       log("AuthRepositoryImpl: performing Google sign-in...");
//       final credential = await _googleAuthService.signIn();

//       final firebase.User? firebaseUser = credential?.user;
//       log("AuthRepositoryImpl: Firebase sign-in returned user = $firebaseUser");

//       if (firebaseUser == null) {
//         throw Exception("No user returned from sign-in");
//       }

//       final userModel = UserModel.fromFirebaseUser(firebaseUser);
//       log("AuthRepositoryImpl: returning signed-in user → ${userModel.id}");
//       return userModel;
//     } catch (e) {
//       log("AuthRepositoryImpl: signIn error → $e");
//       throw Exception("Firebase sign-in failed: $e");
//     }
//   }

//   @override
//   Future<void> signOut() async {
//     log("AuthRepositoryImpl: signOut called");
//     await _googleAuthService.signOut();
//     log("AuthRepositoryImpl: user signed out successfully");
//   }

//   @override
//   Future<User?> getCurrentUser() async {
//     log("AuthRepositoryImpl: getCurrentUser called");

//     final current = _googleAuthService.getCurrentUser();
//     log("AuthRepositoryImpl: Firebase current user = $current");

//     if (current != null) {
//       final userModel = UserModel.fromFirebaseUser(current);
//       log("AuthRepositoryImpl: returning mapped user → ${userModel.id}");
//       return userModel;
//     }

//     log("AuthRepositoryImpl: no user found");
//     return null;
//   }
// }


// import 'dart:developer';
// import 'package:firebase_auth/firebase_auth.dart' as firebase;
// import 'package:workmate/features/auth/data/datasources/google_auth_service.dart';
// import '../models/user_model.dart';
// import '../../domain/entities/user.dart';
// import '../../domain/repositories/auth_repository.dart';

// class AuthRepositoryImpl implements AuthRepository {
//   final GoogleAuthService _googleAuthService;

//   AuthRepositoryImpl(this._googleAuthService);

// @override
// Future<User?> signIn({bool checkOnly = false}) async {
//   try {
//     if (checkOnly) {
//       final firebase.User? current = _googleAuthService.getCurrentUser();
//       if (current != null) {
//         return UserModel.fromFirebaseUser(current);
//       }
//       // Return null instead of throwing exception
//       log("AuthRepository: No current user found during checkOnly.");
//       return null;
//     }

//     final credential = await _googleAuthService.signIn();
//     final firebase.User? firebaseUser = credential?.user;
//     if (firebaseUser == null) {
//       log("AuthRepository: No user returned from Google Sign-In.");
//       return null; // instead of throwing
//     }
//     return UserModel.fromFirebaseUser(firebaseUser);
//   } catch (e, stack) {
//     log("AuthRepository: Firebase sign-in failed → $e");
//     log(stack);
//     return null; // fail gracefully instead of throwing
//   }
// }


//   @override
//   Future<void> signOut() async {
//     log("AuthRepositoryImpl: signOut called");
//     await _googleAuthService.signOut();
//     log("AuthRepositoryImpl: user signed out successfully");
//   }

//   @override
//   Future<User?> getCurrentUser() async {
//     log("AuthRepositoryImpl: getCurrentUser called");

//     final current = _googleAuthService.getCurrentUser();
//     log("AuthRepositoryImpl: Firebase current user = $current");

//     if (current != null) {
//       final userModel = UserModel.fromFirebaseUser(current);
//       log("AuthRepositoryImpl: returning mapped user → ${userModel.id}");
//       return userModel;
//     }

//     log("AuthRepositoryImpl: no user found");
//     return null;
//   }
// }
// auth_repository_impl.dart
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_auth/firebase_auth.dart'; // For User class
import 'package:workmate/features/auth/data/datasources/google_auth_service.dart';
import '../models/user_model.dart';
import '../../domain/entities/user.dart' as domain;
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final GoogleAuthService _googleAuthService;

  AuthRepositoryImpl(this._googleAuthService);

  @override
Future<domain.User?> signIn({bool checkOnly = false}) async {
  try {
    log("AuthRepositoryImpl: signIn called | checkOnly = $checkOnly");

    if (checkOnly) {
      final firebase_auth.User? currentFirebaseUser = _googleAuthService.getCurrentUser();
      if (currentFirebaseUser != null) {
        final userModel = UserModel.fromFirebaseUser(currentFirebaseUser);
        log("AuthRepositoryImpl: returning user from cache -> ${userModel.id}");
        return userModel;
      }
      log("AuthRepositoryImpl: no existing user found");
      return null;
    }

    log("AuthRepositoryImpl: performing Google sign-in...");
    final credential = await _googleAuthService.signInWithGoogle();
    final firebase_auth.User? firebaseUser = credential?.user;

    if (firebaseUser == null) {
      log("AuthRepositoryImpl: Google sign-in failed");
      return null;
    }

    final userModel = UserModel.fromFirebaseUser(firebaseUser);
    log("AuthRepositoryImpl: returning newly signed-in user -> ${userModel.id}");
    return userModel;

  } catch (e, s) {
    log('[AuthRepositoryImpl] Google sign-in failed');
    log('Exception: $e');
    log('Stack trace: $s');
    return null; // Never throw here
  }
}


  @override
  Future<void> signOut() async {
    try {
      log("AuthRepositoryImpl: signOut called");
      await _googleAuthService.signOut();
      log("AuthRepositoryImpl: user signed out successfully");
    } catch (e) {
      log("AuthRepositoryImpl: signOut error -> $e");
      rethrow;
    }
  }

  @override
  Future<domain.User?> getCurrentUser() async {
    log("AuthRepositoryImpl: getCurrentUser called");
    final currentFirebaseUser = _googleAuthService.getCurrentUser();
    if (currentFirebaseUser != null) {
      return UserModel.fromFirebaseUser(currentFirebaseUser);
    }
    return null;
  }
}