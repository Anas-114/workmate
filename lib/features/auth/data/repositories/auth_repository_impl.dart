import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/google_auth_service.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final GoogleAuthService _googleAuthService;

  AuthRepositoryImpl(this._googleAuthService);

  /// Sign in the user using Google
  @override
  Future<User> signIn() async {
    try {
      final account = await _googleAuthService.signIn();
      if (account != null) {
        return UserModel.fromGoogleAccount(account);
      } else {
        throw Exception('Google Sign-In returned null');
      }
    } catch (e) {
      throw Exception('Google Sign-In failed: $e');
    }
  }

  /// Sign out the currently logged-in user
  @override
  Future<void> signOut() async {
    try {
      await _googleAuthService.signOut();
    } catch (e) {
      throw Exception('Google Sign-Out failed: $e');
    }
  }

  /// Get the currently signed-in user (if any)
  @override
  Future<User?> getCurrentUser() async {
    try {
      final account = await _googleAuthService.getCurrentUser();
      if (account != null) {
        return UserModel.fromGoogleAccount(account);
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
