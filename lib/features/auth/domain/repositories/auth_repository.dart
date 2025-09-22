import '../entities/user.dart';

abstract class AuthRepository {
  Future<User?> signIn({bool checkOnly = false});
  Future<void> signOut();
  Future<User?> getCurrentUser();
}
