import '../../data/datasources/google_auth_service.dart';

class SignOut {
  final GoogleAuthService authService;

  SignOut(this.authService);

  Future<void> call() async {
    await authService.signOut();
  }
}
