import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn.standard();

  /// Sign in user with Google
  Future<GoogleSignInAccount?> signIn() async {
    try {
      final account = await _googleSignIn.signIn();
      return account;
    } catch (e) {
      throw Exception('Google Sign-In failed: $e');
    }
  }

  /// Sign out user
  Future<void> signOut() async {
    try {
      await _googleSignIn.disconnect();
      await _googleSignIn.signOut();
    } catch (e) {
      throw Exception('Google Sign-Out failed: $e');
    }
  }

  /// Get currently signed-in user
  Future<GoogleSignInAccount?> getCurrentUser() async {
    try {
      final account = await _googleSignIn.signInSilently();
      return account;
    } catch (e) {
      return null;
    }
  }
}
