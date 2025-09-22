import 'dart:developer';

import '../repositories/auth_repository.dart';
import '../entities/user.dart';

class SignIn {
  final AuthRepository repository;

  SignIn(this.repository);

  /// If [checkOnly] is true, return the current user without triggering Google Sign-In
  Future<User?> call({bool checkOnly = false}) async {
    log("SignIn UseCase: called | checkOnly = $checkOnly");

    final user = await repository.signIn(checkOnly: checkOnly);

    if (user != null) {
      log("SignIn UseCase: user signed in successfully → ${user.id}");
    } else {
      log("SignIn UseCase: no user returned");
    }

    return user;
  }
}
