import 'dart:developer';

import '../repositories/auth_repository.dart';

class SignOut {
  final AuthRepository repository;

  SignOut(this.repository);

  Future<void> call() async {
    log("SignOut UseCase: called");

    await repository.signOut();

    log("SignOut UseCase: user signed out successfully");
  }
}
