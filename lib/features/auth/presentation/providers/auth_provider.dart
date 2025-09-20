import 'package:flutter/material.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/sign_in.dart';
import '../../domain/usecases/sign_out.dart';

class AuthProvider extends ChangeNotifier {
  final SignIn signInUsecase;
  final SignOut signOutUsecase;

  User? _user;
  bool _isLoading = false;

  AuthProvider({
    required this.signInUsecase,
    required this.signOutUsecase,
  });

  User? get user => _user;
  bool get isLoading => _isLoading;
  bool get isLoggedIn => _user != null;

  Future<void> login() async {
    _isLoading = true;
    notifyListeners();

    try {
      _user = await signInUsecase();
    } catch (e) {
      debugPrint("Login error: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    _isLoading = true;
    notifyListeners();

    try {
      await signOutUsecase();
      _user = null;
    } catch (e) {
      debugPrint("Logout error: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
