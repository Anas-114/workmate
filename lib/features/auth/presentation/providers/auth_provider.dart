// import 'dart:async';
// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:workmate/features/auth/domain/usecases/sign_in.dart';
// import 'package:workmate/features/auth/domain/usecases/sign_out.dart';
// import 'package:workmate/features/users/domain/entities/user.dart' as app_user;
// import 'package:workmate/features/auth/domain/entities/user.dart' as auth_user;

// class AuthProvider extends ChangeNotifier {
//   final SignIn signInUsecase;
//   final SignOut signOutUsecase;

//   app_user.User? _user;
//   bool _isLoading = false;
//   String? _error;
//   Completer<void>? _currentOperation;

//   AuthProvider({
//     required this.signInUsecase,
//     required this.signOutUsecase,
//   });

//   app_user.User? get user => _user;
//   bool get isLoading => _isLoading;
//   String? get error => _error;
//   bool get isLoggedIn => _user != null;
//   bool get hasError => _error != null;

//   /// Call this once during app startup
//   Future<void> initAuth() async {
//     if (_isLoading) return;
    
//     _isLoading = true;
//     _error = null;

//     try {
//       log("AuthProvider: initAuth started");

//       final auth_user.User? existing = await signInUsecase(checkOnly: true);

//       if (existing != null) {
//         log("AuthProvider: existing user found → ${existing.id}, ${existing.email}");
//         _user = _convertAuthUserToAppUser(existing);
//       } else {
//         log("AuthProvider: no existing user");
//         _user = null;
//       }
//     } catch (e, stack) {
//       log("AuthProvider: initAuth error → $e");
//       log(stack.toString());
//       _error = e.toString();
//     } finally {
//       _isLoading = false;
//       _safeNotifyListeners();
//       log("AuthProvider: initAuth finished");
//     }
//   }

//   /// Call this ONLY when user presses "Login"
//   Future<void> login() async {
//     if (_isLoading || _currentOperation != null) {
//       log("AuthProvider: login skipped → operation already in progress");
//       return;
//     }

//     if (_user != null) {
//       log("AuthProvider: login skipped → user already logged in");
//       return;
//     }

//     _currentOperation = Completer<void>();
//     _isLoading = true;
//     _error = null;

//     try {
//       log("AuthProvider: login started");

//       final auth_user.User? signedInUser = await signInUsecase();

//       if (signedInUser != null) {
//         log("AuthProvider: login success → ${signedInUser.id}, ${signedInUser.email}");
//         _user = _convertAuthUserToAppUser(signedInUser);
//       } else {
//         log("AuthProvider: login returned null user");
//         _error = "Login failed: No user returned";
//       }
//     } catch (e, stack) {
//       log("AuthProvider: login error → $e");
//       log(stack.toString());
//       _error = e.toString();
//     } finally {
//       _isLoading = false;
//       _currentOperation?.complete();
//       _currentOperation = null;
//       _safeNotifyListeners();
//       log("AuthProvider: login finished");
//     }
//   }

//   Future<void> logout() async {
//     if (_isLoading || _currentOperation != null) {
//       log("AuthProvider: logout skipped → operation already in progress");
//       return;
//     }

//     if (_user == null) {
//       log("AuthProvider: logout skipped → no user logged in");
//       return;
//     }

//     _currentOperation = Completer<void>();
//     _isLoading = true;
//     _error = null;

//     try {
//       log("AuthProvider: logout started");

//       await signOutUsecase();
//       _user = null;

//       log("AuthProvider: logout success");
//     } catch (e, stack) {
//       log("AuthProvider: logout error → $e");
//       log(stack.toString());
//       _error = e.toString();
//     } finally {
//       _isLoading = false;
//       _currentOperation?.complete();
//       _currentOperation = null;
//       _safeNotifyListeners();
//       log("AuthProvider: logout finished");
//     }
//   }

//   void clearError() {
//     _error = null;
//     _safeNotifyListeners();
//   }

//   // Safe notification to avoid build conflicts
//   void _safeNotifyListeners() {
//     if (!_isLoading) {
//       WidgetsBinding.instance.addPostFrameCallback((_) {
//         notifyListeners();
//       });
//     }
//   }

//   // Convert auth user to app user safely
//  // Corrected method in AuthProvider
// app_user.User _convertAuthUserToAppUser(auth_user.User authUser) {
//   // Use a hash of the UID if you need a numeric ID, or consider changing app_user.User.id to String
//   final int id = _generateIdFromString(authUser.id);
  
//   return app_user.User(
//     id: id,
//     name: authUser.name,
//     email: authUser.email,
//     avatar: authUser.photoUrl ?? '',
//     job: '', // Add this line to provide a default value for 'job'
//   );
// }

//   // Generate a consistent numeric ID from string UID
//   int _generateIdFromString(String uid) {
//     return uid.hashCode.abs(); // Convert string to positive integer hash
//   }
// }



import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:workmate/features/auth/domain/usecases/sign_in.dart';
import 'package:workmate/features/auth/domain/usecases/sign_out.dart';
  // New import
import 'package:workmate/features/users/domain/entities/user.dart' as app_user;
import 'package:workmate/features/auth/domain/entities/user.dart' as auth_user;

class AuthProvider extends ChangeNotifier {
  final SignIn signInUsecase;
  final SignOut signOutUsecase;
  // final DeleteProfile deleteProfileUsecase; // New field

  app_user.User? _user;
  bool _isLoading = false;
  String? _error;
  Completer<void>? _currentOperation;

  AuthProvider({
    required this.signInUsecase,
    required this.signOutUsecase,
    // required this.deleteProfileUsecase, // New required parameter
  });

  app_user.User? get user => _user;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get isLoggedIn => _user != null;
  bool get hasError => _error != null;

  /// Call this once during app startup
  Future<void> initAuth() async {
    if (_isLoading) return;
    
    _isLoading = true;
    _error = null;

    try {
      log("AuthProvider: initAuth started");

      final auth_user.User? existing = await signInUsecase(checkOnly: true);

      if (existing != null) {
        log("AuthProvider: existing user found → ${existing.id}, ${existing.email}");
        _user = _convertAuthUserToAppUser(existing);
      } else {
        log("AuthProvider: no existing user");
        _user = null;
      }
    } catch (e, stack) {
      log("AuthProvider: initAuth error → $e");
      log(stack.toString());
      _error = e.toString();
    } finally {
      _isLoading = false;
      _safeNotifyListeners();
      log("AuthProvider: initAuth finished");
    }
  }

  /// Call this ONLY when user presses "Login"
  Future<void> login() async {
    if (_isLoading || _currentOperation != null) {
      log("AuthProvider: login skipped → operation already in progress");
      return;
    }

    if (_user != null) {
      log("AuthProvider: login skipped → user already logged in");
      return;
    }

    _currentOperation = Completer<void>();
    _isLoading = true;
    _error = null;

    try {
      log("AuthProvider: login started");

      final auth_user.User? signedInUser = await signInUsecase();

      if (signedInUser != null) {
        log("AuthProvider: login success → ${signedInUser.id}, ${signedInUser.email}");
        _user = _convertAuthUserToAppUser(signedInUser);
      } else {
        log("AuthProvider: login returned null user");
        _error = "Login failed: No user returned";
      }
    } catch (e, stack) {
      log("AuthProvider: login error → $e");
      log(stack.toString());
      _error = e.toString();
    } finally {
      _isLoading = false;
      _currentOperation?.complete();
      _currentOperation = null;
      _safeNotifyListeners();
      log("AuthProvider: login finished");
    }
  }

  Future<void> logout() async {
    if (_isLoading || _currentOperation != null) {
      log("AuthProvider: logout skipped → operation already in progress");
      return;
    }

    if (_user == null) {
      log("AuthProvider: logout skipped → no user logged in");
      return;
    }

    _currentOperation = Completer<void>();
    _isLoading = true;
    _error = null;

    try {
      log("AuthProvider: logout started");
      await signOutUsecase();
      // await deleteProfileUsecase(); // Clears local database
      _user = null;
      log("AuthProvider: logout success");
    } catch (e, stack) {
      log("AuthProvider: logout error → $e");
      log(stack.toString());
      _error = e.toString();
    } finally {
      _isLoading = false;
      _currentOperation?.complete();
      _currentOperation = null;
      _safeNotifyListeners();
      log("AuthProvider: logout finished");
    }
  }

  void clearError() {
    _error = null;
    _safeNotifyListeners();
  }

  // Safe notification to avoid build conflicts
  void _safeNotifyListeners() {
    if (!_isLoading) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners();
      });
    }
  }

  // Convert auth user to app user safely
  app_user.User _convertAuthUserToAppUser(auth_user.User authUser) {
    // Use a hash of the UID if you need a numeric ID
    final int id = _generateIdFromString(authUser.id);
    
    return app_user.User(
      id: id,
      name: authUser.name,
      email: authUser.email,
      avatar: authUser.photoUrl ?? '',
      job: '', // Provide a default value for 'job'
    );
  }

  // Generate a consistent numeric ID from string UID
  int _generateIdFromString(String uid) {
    return uid.hashCode.abs();
  }
}