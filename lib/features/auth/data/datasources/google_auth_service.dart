import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Pass your server client ID here
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    
    serverClientId: "920461569916-89f6r6adpjle4dcsbb8sbbhmc0cs4dcr.apps.googleusercontent.com",
  );

  /// Sign in with Google
  Future<UserCredential?> signIn() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        log("Google sign-in aborted by user.");
        return null;
      }

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await _auth.signInWithCredential(credential);
      log("Google sign-in successful: ${userCredential.user?.email}");
      return userCredential;
    } catch (e, stackTrace) {
      log("Error during Google sign-in: $e");
      log("Stack trace: $stackTrace");
      return null;
    }
  }

  /// Sign out from Firebase and Google
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      await _googleSignIn.signOut();
      log("Signed out successfully.");
    } catch (e, stackTrace) {
      log("Error during sign-out: $e");
      log("Stack trace: $stackTrace");
    }
  }

  /// Get current signed-in user
  User? getCurrentUser() {
    try {
      final user = _auth.currentUser;
      log("Current user: ${user?.email ?? 'No user signed in'}");
      return user;
    } catch (e, stackTrace) {
      log("Error getting current user: $e");
      log("Stack trace: $stackTrace");
      return null;
    }
  }
}
